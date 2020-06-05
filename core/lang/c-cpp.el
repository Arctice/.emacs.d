(setq-default c-basic-offset 4)

;; open .h files in C++ mode by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c++-mode))

(when (load "/usr/share/emacs/site-lisp/clang-format/clang-format.el" t)
  (add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key [C-M-tab] 'clang-format-region)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "TAB") 'clang-format))))

(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (kbd "M-n") 'ff-find-related-file)
            (local-set-key (kbd "C-c C-c") #'project-save-compile)))



