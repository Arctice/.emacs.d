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

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; saner mouse scrolling
(setq mouse-wheel-scroll-amount '(4 ((shift) . 4))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; swiper no swiping
(ivy-mode 1)
(setq ivy-use-virtual-buffers 1)
(setq swiper-stay-on-quit t)
;; (global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c C-g") 'counsel-git-grep)
(global-set-key (kbd "M-y") 'counsel-yank-pop)



(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(use-package neotree
  :config
  :defer t
  :bind ([f8] . 'neotree-project-dir))


(setq neo-theme (if (display-graphic-p) 'ascii 'ascii))
(setq neo-smart-open t)
