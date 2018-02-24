;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Start in *scratch*
(setq inhibit-startup-message t)


;; Desktop sessions
(setq desktop-load-locked-desktop t)
(setq desktop-restore-eager 4)
(setq desktop-restore-frames t)
(setq desktop-save 0)
(setq desktop-buffers-not-to-save "\\` \\|\\*.+\\*")
(setq desktop-path (quote ("~/.emacs.d/session")))
(setq desktop-lazy-verbose nil)
(desktop-change-dir "~/.emacs.d/session")
(desktop-save-mode 1)



;; Save backups in ~/.emacs.d/session/backups
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory
                        "session/backups"))))
(setq auto-save-default t)


;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))
