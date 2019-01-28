;; Let elpy do elpy things
(elpy-enable)

(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")

(setq elpy-rpc-python-command "python3")

;; yapf binding, fmt the entire file on tab for now
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "TAB") 'elpy-yapf-fix-code)))


;; DON'T LET ELPY DO ELPY THINGS
(substitute-key-definition
 'elpy-nav-forward-block nil elpy-mode-map)

(substitute-key-definition
 'elpy-nav-backward-block nil elpy-mode-map)
