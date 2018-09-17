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
    git-gutter
    magit

    cider
    clojure-mode
    clojure-mode-extra-font-locking

    elpy
    lua-mode
    ;; tagedit webpaste flycheck
    ivy
    swiper
    counsel
    anzu
    neotree
    diminish
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


(load "tabbar-conf")
(load "editing")
(load "navigation")
(load "ui")
(load "theme")
(load "misc")


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(split-window-right)
