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
(global-linum-mode)

(blink-cursor-mode 0)

(setq-default frame-title-format "%b (%f)")

;; Hide toolbar
(when (fboundp 'tool-bar-mode)
 (tool-bar-mode -1))

;; Hide scroll bars
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

