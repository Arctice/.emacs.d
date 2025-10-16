(setq-default c-basic-offset 4)

;; open .h files in C++ mode by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c++-mode))

(defun tramp-safe-clang-format ()
  (interactive)
  (let ((start (if (use-region-p) (region-beginning) (point)))
        (end (if (use-region-p) (region-end) (point)))
        (assumed-filename
         (if (file-remote-p buffer-file-name)
             (concat (getenv "HOME") "/" (file-name-nondirectory buffer-file-name))
           buffer-file-name)))
    (clang-format-region start end clang-format-style assumed-filename)))

(defun clang-format-select ()
  (if (file-remote-p default-directory)
      'tramp-safe-clang-format 'clang-format))

(when (load "/usr/share/emacs/site-lisp/clang-format/clang-format.el" t)
  (add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key [C-M-tab] 'clang-format-region)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "TAB") (clang-format-select))))
  (add-hook 'java-mode-hook
            (lambda ()
              (local-set-key (kbd "TAB") (clang-format-select))))
  (add-hook 'java-mode-hook
            (lambda ()
              (local-set-key [C-M-tab] 'clang-format-region))))

(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (kbd "M-n") 'ff-find-related-file)))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-offset 'innamespace 0)))

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key (kbd "M-n") 'ff-find-related-file)))
