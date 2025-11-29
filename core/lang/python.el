(custom-set-variables
 '(elpy-modules '(elpy-module-pyvenv elpy-module-sane-defaults)))

;; Let elpy do elpy things
(elpy-enable)

;; DON'T LET ELPY DO ELPY THINGS
(substitute-key-definition
 'elpy-nav-forward-block nil elpy-mode-map)

(substitute-key-definition
 'elpy-nav-backward-block nil elpy-mode-map)

;; TODO: This explodes elpy on systems without ipython
;; not a huge issue but I'd appreciate better reliability
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")

(setq elpy-rpc-python-command "python3")

;; yapf binding, fmt the entire file on tab for now
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "TAB") 'elpy-yapf-fix-code)))

;; are you fucking serious
(setq python-indent-guess-indent-offset nil)

;; no thanks
(global-eldoc-mode -1)
