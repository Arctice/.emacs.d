;; Reload files when they change in the filesystem
(global-auto-revert-mode)


;; tries to make compilation-mode buffers smarter
;; by having them popup in existing windows rather
;; than creating new ones on use in another frame
(load "reuse-mode-windows")
(enable-window-reuse-for-modes 'compilation-mode)

;; do not normally prompt for compilation command 
(setq compilation-read-command nil)

;; Make the compilation window automatically disappear
;; from enberg on #emacs
(defun close-compilation-buffer-on-success
    (delay)
  (lambda
    (compilation-buffer result)
    (if (null (string-match ".*exited abnormally.*" result))
        (progn
          (run-at-time
           "0 sec" nil
           (lambda ()
             (select-window (get-buffer-window
                             (get-buffer-create "*compilation*")))
             (switch-to-buffer nil)))
          (message "No Compilation Errors!")))))

;; (setq compilation-finish-functions
      ;; (close-compilation-buffer-on-success "0 sec"))

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


