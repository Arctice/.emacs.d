;; rainbows
(autoload 'rainbow-delimiters-mode "rainbow-delimiters")
(add-hook 'emacs-lisp-mode-hook       #'rainbow-delimiters-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook #'rainbow-delimiters-mode)
(add-hook 'python-mode-hook #'rainbow-delimiters-mode)


;; enables rainbows everywhere
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;; Yafolding, everywhere
(define-globalized-minor-mode global-yafolding-mode yafolding-mode
  (lambda () (yafolding-mode 1)))
(global-yafolding-mode 1)


;; Display column in info bar
(column-number-mode 1)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Line numbers
(if (>= emacs-major-version 26)
    (global-display-line-numbers-mode 1)
  (progn (global-linum-mode)
         (setq linum-format "%3d|")))
;; Disable line numbers for terms, since it breaks them
(add-hook 'term-mode-hook
          (lambda () (progn
                       (if (>= emacs-major-version 26)
                           (display-line-numbers-mode -1))
                       (linum-mode -1))))


;; perish annoyances
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)


;; concise frame title
(setq-default frame-title-format "%b (%f)")


;; git-gutter
(when (not (eq system-type 'windows-nt))
  (global-git-gutter-mode 1))


;; highlights
(global-hi-lock-mode)
