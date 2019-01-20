;; Mekk https://gist.github.com/Mekk/aad77cf3401a17e5df0d
;; Based on http://stackoverflow.com/questions/28309340/managing-emacs-man-buffer-location/28311686

(defun enable-window-reuse-for-modes (&rest modes)
  "Enables window reuse for given modes - for any of modes specified, 
in case there already exist window of given mode, new incarnation will reuse them.
Examples:
   (require 'my-window-reuse)
   (enable-window-reuse-for-modes 'Man-mode)
   ; or
   (enable-window-reuse-for-modes 'Man-mode 'Info-mode)
"
  (lexical-let ((checked-modes modes))
    (add-to-list 'display-buffer-alist
                 (cons (lambda (buffer alist)
                         (with-current-buffer buffer
                           (memq major-mode checked-modes)))
                       (cons 'display-buffer-reuse-major-mode-window
                             '((inhibit-same-window . nil)
                               (reusable-frames . visible)
                               (inhibit-switch-frame . nil)))))))

(defun display-buffer-reuse-major-mode-window (buffer alist)
  "Return a window displaying a buffer in BUFFER's major mode.
Return nil if no usable window is found.
If ALIST has a non-nil `inhibit-same-window' entry, the selected
window is not eligible for reuse.
If ALIST contains a `reusable-frames' entry, its value determines
which frames to search for a reusable window:
  nil -- the selected frame (actually the last non-minibuffer frame)
  A frame   -- just that frame
  `visible' -- all visible frames
  0   -- all frames on the current terminal
  t   -- all frames.
If ALIST contains no `reusable-frames' entry, search just the
selected frame if `display-buffer-reuse-frames' and
`pop-up-frames' are both nil; search all frames on the current
terminal if either of those variables is non-nil.
If ALIST has a non-nil `inhibit-switch-frame' entry, then in the
event that a window on another frame is chosen, avoid raising
that frame."
  (let* ((alist-entry (assq 'reusable-frames alist))
         (frames (cond (alist-entry (cdr alist-entry))
                       ((if (eq pop-up-frames 'graphic-only)
                            (display-graphic-p)
                          pop-up-frames)
                        0)
                       (display-buffer-reuse-frames 0)
                       (t (last-nonminibuffer-frame))))
         (window (let ((mode (with-current-buffer buffer major-mode)))
                   (if (and (eq mode (with-current-buffer (window-buffer)
                                       major-mode))
                            (not (cdr (assq 'inhibit-same-window alist))))
                       (selected-window)
                     (catch 'window
                       (walk-windows
                        (lambda (w)
                          (and (window-live-p w)
                               (eq mode (with-current-buffer (window-buffer w)
                                          major-mode))
                               (not (eq w (selected-window)))
                               (throw 'window w)))
                        'nomini frames))))))
    (when (window-live-p window)
      (prog1 (window--display-buffer buffer window 'reuse alist)
        (unless (cdr (assq 'inhibit-switch-frame alist))
          (window--maybe-raise-frame (window-frame window)))))))

(provide 'my-window-reuse)
;; (require 'my-window-reuse)
