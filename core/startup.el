;; Temporarily disable the GC while initializing emacs
(setq gc-cons-threshold 64000000)
;; Restore GC after init
(add-hook 'after-init-hook
          #'(lambda ()
              (setq gc-cons-threshold 16777216)))
;; Also temporarily neuter file-name-handler-alist (thanks DOOM)
(defvar saved--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
  (lambda () (setq file-name-handler-alist saved--file-name-handler-alist)))

;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Hide all GUI
;; Doing this early to hide them during startup
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))


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
;; (desktop-save-mode 1)



;; save backups and autosaves in ~/.emacs.d/session/
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory
                        "session/backups/"))))
(setq auto-save-default t)
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory
                       "session/auto-save/") t)))

;; No need for ~ files when editing
(setq create-lockfiles nil)
 

;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))


;; start the emacs server 
;; dont warn if server-start failed for some reason
;; (e.g. if the server was already running somewhere else)
(setq warning-suppress-types '((server)))
(server-start)

