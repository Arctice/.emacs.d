
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook
            (lambda ()
              (local-set-key (kbd "TAB") 'rust-format-buffer)))
