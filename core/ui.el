;; rainbows
(autoload 'rainbow-delimiters-mode "rainbow-delimiters")
(dolist (rainbowy '(emacs-lisp-mode-hook
                    eval-expression-minibuffer-setup-hook
                    ielm-mode-hook
                    lisp-mode-hook
                    lisp-interaction-mode-hook
                    python-mode-hook
                    scheme-mode-hook))
  (add-hook rainbowy #'rainbow-delimiters-mode))

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

;; read-only prompts in shell-like buffers
(setq comint-prompt-read-only t)


;; Yafolding, everywhere
(define-globalized-minor-mode global-yafolding-mode yafolding-mode
  (lambda () (yafolding-mode 1)))
(global-yafolding-mode 1)


;; compile buffer tweaks

;; handle ansi color codes in compile buffers
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; default to scrolling the output
(setq compilation-scroll-output t)


(defun reader-mode (&optional opt)
  "I frequently use read-only and scroll-lock modes in tandem for reading text
this helper function toggles them both at once"
  (interactive)
  (let ((set (lambda (opt) (read-only-mode opt) (scroll-lock-mode opt))))
    (if opt (funcall set opt)
      (funcall set
               (if (bound-and-true-p scroll-lock-mode)
                   0 1)))))


;; Display column in info bar
(column-number-mode 1)

;; modeline
(require 'diminish)
(diminish 'git-gutter-mode)
(diminish 'global-git-gutter-mode)
(diminish 'ivy-mode)
(diminish 'eldoc-mode)
(diminish 'paredit-mode)
(diminish 'abbrev-mode)

(setq projectile-mode-line-function
      (lambda () (format " [%s]" (projectile-project-name))))


;; startup dashboard
(use-package dashboard
  :config (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "")
(setq dashboard-footer "")
(setq dashboard-startup-banner nil)
(setq dashboard-set-footer nil)
(setq dashboard-items '((projects . 4)
                        (recents  . 25)
                        (projects . 50)))


