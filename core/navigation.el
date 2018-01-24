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


