(setq-default c-basic-offset 4)

;; open .h files in C++ mode by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; (generated keyboard macro)
;; runs C-p S then C-p c and confirms
(fset 'project-save-compile
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([3 112 83 3 112 99] 0 "%d")) arg)))

(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") #'project-save-compile)))



