;; Reload files when they change in the filesystem
(global-auto-revert-mode)


;; tries to make compilation-mode buffers smarter
;; by having them popup in existing windows rather
;; than creating new ones on use in another frame
(load "reuse-mode-windows")
(enable-window-reuse-for-modes 'compilation-mode)

;; do not normally prompt for compilation command 
;; TODO: seems to break occasionally, maybe in directories
;; with no project or on old projectile versions. Investigate
(setq compilation-read-command nil)


;; TODO: The below is nice to have sometimes. Maybe add a way of enabling it?

;; Make the compilation window automatically disappear
;; from enberg on #emacs
;; (defun close-compilation-buffer-on-success
;;     (delay)
;;   (lambda
;;     (compilation-buffer result)
;;     (if (null (string-match ".*exited abnormally.*" result))
;;         (progn
;;           (run-at-time
;;            "0 sec" nil
;;            (lambda ()
;;              (select-window (get-buffer-window
;;                              (get-buffer-create "*compilation*")))
;;              (switch-to-buffer nil)))
;;           (message "No Compilation Errors!")))))

;; (setq compilation-finish-functions
      ;; (close-compilation-buffer-on-success "0 sec"))

;; (generated keyboard macro)
;; runs C-p S then C-p c and confirms
(fset 'project-save-compile
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (progn (ignore-errors (kill-compilation))
               (kmacro-exec-ring-item (quote ([3 112 83 3 112 99] 0 "%d")) arg))))

(global-set-key (kbd "<insert>") #'project-save-compile)

(use-package magit
  :bind ("C-c g" . 'magit-status)
  :config (message "Use-package: Loading magit...")
  :defer t)


;; http://www.emacswiki.org/emacs/SavePlace
(setq save-place-file (concat user-emacs-directory "places"))
(save-place-mode 1)


;; dumb jumping
(use-package dumb-jump
  :bind (("C-j" . dumb-jump-go-other-window))
  :defer t)
(setq dumb-jump-selector 'ivy)
;; lisp mode likes to use C-j for newline-and-indent
;; so use use-package's bind-key* to enforce this binding globally
;; pray that this does not break something in the future
(bind-keys* ("C-j" . dumb-jump-go-other-window))



;; Quickly diffing regions
;; Thank you, Chen Bin
;; http://blog.binchen.org/posts/diff-regions-in-emacs.html
;; Step 1: Select a region and `M-x diff-region-from'
;; Step 2: Select another region and `M-x diff-region-to'
;; Press "q" in evil-mode or "C-c C-c" to exit the diff output buffer
(defun diff-region-format-region-boundary (b e)
  "Make sure lines are selected and B is less than E"
  (let (tmp rlt)
    ;; swap b e, make sure b < e
    (when (> b e)
      (setq tmp b)
      (setq b e)
      (set e tmp))

    ;; select lines
    (save-excursion
      ;; Another workaround for evil-visual-line bug:
      ;; In evil-mode, if we use hotkey V or `M-x evil-visual-line` to select line,
      ;; the (line-beginning-position) of the line which is after the last selected
      ;; line is always (region-end)! Don't know why.
      (if (and (> e b)
               (save-excursion (goto-char e) (= e (line-beginning-position)))
               (boundp 'evil-state) (eq evil-state 'visual))
          (setq e (1- e)))
      (goto-char b)
      (setq b (line-beginning-position))
      (goto-char e)
      (setq e (line-end-position)))
    (setq rlt (list b e))
    rlt))

(defun diff-region-exit ()
  (interactive)
  (bury-buffer "*Diff-region-output*")
  (switch-to-prev-buffer))

(defun diff-region-from ()
  "Select a region to compare"
  (interactive)
  (when (region-active-p)
    (let (tmp buf)
      ;; select lines
      (setq tmp (diff-region-format-region-boundary (region-beginning) (region-end)))
      (setq buf (get-buffer-create "*Diff-regionA*"))
      (save-current-buffer
        (set-buffer buf)
        (erase-buffer))
      (append-to-buffer buf (car tmp) (cadr tmp))))
  (message "Now select other region to diff and run `diff-region-to`"))

(defun diff-region-to ()
  "Compare current region with region selected by `diff-region-from' "
  (interactive)
  (if (region-active-p)
      (let (rlt-buf
            diff-output
            (fa (make-temp-file (expand-file-name "scor"
                                                  (or small-temporary-file-directory
                                                      temporary-file-directory))))
            (fb (make-temp-file (expand-file-name "scor"
                                                  (or small-temporary-file-directory
                                                      temporary-file-directory)))))
        ;;  save current content as file B
        (when fb
          (setq tmp (diff-region-format-region-boundary (region-beginning) (region-end)))
          (write-region (car tmp) (cadr tmp) fb))

        (setq rlt-buf (get-buffer-create "*Diff-region-output*"))
        (when (and fa (file-exists-p fa) fb (file-exists-p fb))
          ;; save region A as file A
          (save-current-buffer
            (set-buffer (get-buffer-create "*Diff-regionA*"))
            (write-region (point-min) (point-max) fa))
          ;; diff NOW!
          (setq diff-output (shell-command-to-string (format "diff -Nabu --strip-trailing-cr %s %s" fa fb)))
          ;; show the diff output
          (if (string= diff-output "")
              ;; two regions are same
              (message "Two regions are SAME!")
            ;; show the diff
            (save-current-buffer
              (switch-to-buffer-other-window rlt-buf)
              (set-buffer rlt-buf)
              (read-only-mode 0)
              (erase-buffer)
              (insert diff-output)
              (diff-mode)
              (read-only-mode 1)
              (if (fboundp 'evil-local-set-key)
                           (evil-local-set-key 'normal "q" 'diff-region-exit))
              (local-set-key (kbd "C-c C-c") 'diff-region-exit)
              )))

        ;; clean the temporary files
        (if (and fa (file-exists-p fa))
            (delete-file fa))
        (if (and fb (file-exists-p fb))
            (delete-file fb)))
    (message "Please select a region with `diff-region-from` first!")))
