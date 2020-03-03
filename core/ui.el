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

;; compile buffer tweaks

;; handle ansi color codes in compile buffers
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; default to scrolling the output
(setq compilation-scroll-output t)
