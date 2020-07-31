;; smex
;; https://www.emacswiki.org/emacs/Smex
(use-package smex
  :config
  (setq smex-save-file (concat user-emacs-directory "session/.smex-items"))
  (smex-initialize)
  :bind ("M-x" . 'smex)
  :defer t
  )

;; ido
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode t)
(ido-ubiquitous-mode 1)
(setq ido-use-virtual-buffers t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)


;; swiper no swiping
(ivy-mode 1)
(setq ivy-use-virtual-buffers 1)
(setq swiper-stay-on-quit t)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "M-y") 'counsel-yank-pop)


;; projectile everywhere!
(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; workaround for broken projectile C-p c behaviour
;; occasionally wouldn't prompt for compile command
(setq projectile-project-compilation-cmd "")


(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))


(load "tab-bar")


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)


;; saner mouse scrolling
(setq mouse-wheel-scroll-amount '(4 ((shift) . 4))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling


;; die annoying visual lines
(setq line-move-visual nil)
(set-default 'truncate-lines t)


(load "dired-hacks")


(defun other-window-reverse ()
  (interactive) (other-window -1))

