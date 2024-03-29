;; General text editing tweaks

(load "lang/lisp")
(load "lang/c-cpp")
(load "lang/rust")
(load "lang/clojure")
(load "lang/scheme")
(load "lang/python")


;; Search replacements

(defun swipest (&optional initial-input)
  (interactive)
  (move-to-window-line-top-bottom 0)
  (if initial-input
      (swiper initial-input) (swiper)))
(global-set-key (kbd "C-s") 'swipest)
(global-set-key (kbd "C-r") 'anzu-query-replace-regexp)


;; Replace region by typing
(delete-selection-mode 1)


;; comments
(defun toggle-comment ()
  "comment or uncomment current line, or the region if one is active"
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region
       (region-beginning)
       (region-end))
    (comment-or-uncomment-region
     (line-beginning-position)
     (line-end-position))
    ))
(global-set-key (kbd "C-;") 'toggle-comment) 


;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)
;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))


;; DIE INSERT MODE
(global-unset-key (kbd "<insert>"))
(global-unset-key (kbd "<insertchar>"))


;; Don't use hard tabs
(setq-default indent-tabs-mode nil)
;; use 4 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 4)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))


;; shell scripts
(setq-default sh-basic-offset 4)
(setq-default sh-indentation 4)


;; Disable automatic indents on newline
;; or don't
;; TODO: electric mode is a little obnoxious at times but writing without it
;; feels quite bad. A smarter solution is needed here
(setq electric-indent-mode t)


;; Makes current buffer's window sticky
;; Based on https://stackoverflow.com/questions/43765/pin-emacs-buffers-to-windows-for-cscope/65992#65992
(defun toggle-window-sticky ()
  (interactive)
  (message 
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window 
                                 (not (window-dedicated-p window))))
       "Window '%s' made dedicated"
     "Window '%s' no longer dedicated")
   (current-buffer)))


;; Re-enable disabled functions
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)


;; 80 character paragraphs
(setq-default fill-column 80)
