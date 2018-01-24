;; General text editing tweaks


;; Search with regex
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

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


;; http://www.emacswiki.org/emacs/SavePlace
(setq save-place-file (concat user-emacs-directory "places"))
(save-place-mode 1)


;; Don't use hard tabs
(setq-default indent-tabs-mode nil)
;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; shell scripts
(setq-default sh-basic-offset 4)
(setq-default sh-indentation 4)

;; Disable automatic indents on newline
;; (setq electric-indent-mode nil)

;; paredit
;; http://www.emacswiki.org/emacs/PareditCheatsheet
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)


;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; python
;; (elpy-enable)
;; (elpy-use-ipython)


;; (load "setup-clojure")


