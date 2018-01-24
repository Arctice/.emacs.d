;; Temporarily disable the GC while initializing emacs
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook
          #'(lambda ()
              ;; Restore GC after init
              (setq gc-cons-threshold 800000)))

(require 'cl-lib)
(cl-labels ((add-path (path)
		   (add-to-list
		    'load-path
		    (concat user-emacs-directory path))))
  (mapc #'add-path
	[ "core"
          "vendor/use-package"
          "themes"]))

(load "startup.el")

(defvar package-list
  '(smex
    ido-completing-read+
    tabbar
    paredit
    rainbow-delimiters
    exec-path-from-shell
    solarized-theme
    projectile
    yafolding
    magit
    ;; clojure-mode cider
    ;; clojure-mode-extra-font-locking
    ;; elpy lua-mode tagedit webpaste
    )
  )

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(let ((missing-packages
       (seq-remove #'package-installed-p package-list)))
  (when missing-packages
    (package-refresh-contents)
    (mapc 'package-install missing-packages)
    ))


(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)


(load "navigation")
(load "tabbar-conf")
(load "theme")
(load "editing")
(load "ui")
(load "misc")


;; projectile everywhere!
;; (projectile-global-mode)


;; (custom-set-variables
;;  '(solarized-high-contrast-mode-line t)
;;  '(solarized-scale-org-headlines nil)
;;  '(webpaste-provider-priority
;;    (quote
;;     ("ix.io" "sprunge.us" "dpaste.com" "dpaste.de" "gist.github.com" "paste.pound-python.org"))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(desktop-buffers-not-to-save "\\` \\|\\*.+\\*")
 '(desktop-lazy-verbose nil)
 '(desktop-path (quote ("~/.emacs.d/session" "~")))
 '(desktop-restore-forces-onscreen nil)
 '(package-selected-packages
   (quote
    (use-package tabbar solarized-theme rainbow-delimiters paredit ido-completing-read+ exec-path-from-shell)))
 '(tabbar-separator (quote (0.4))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
