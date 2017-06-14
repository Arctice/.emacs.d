(require 'cl-lib)
(cl-labels ((add-path (path)
		   (add-to-list
		    'load-path
		    (concat user-emacs-directory path))))
  (mapc #'add-path
	[ "core" ]))

(load "startup.el")


(defvar package-list
  '(smex
    ido-completing-read+
    tabbar
    paredit
    rainbow-delimiters
    exec-path-from-shell
    solarized-theme
    yafolding
    ;; clojure-mode
    ;; clojure-mode-extra-font-locking
    ;; projectile tagedit cider
    ;; magit solarized-theme elpy lua-mode webpaste  cider
    )
  )

(require 'package)
(package-initialize) ;; necessary?
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

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(desktop-path (quote ("~/.emacs.d/session")))
 '(fci-rule-color "#2a2a2a")
 '(package-selected-packages
   (quote
    (solarized-theme tabbar smex rainbow-delimiters paredit ido-completing-read+ exec-path-from-shell)))
 '(tabbar-separator (quote (0.4))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
