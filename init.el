(require 'cl-lib)
(cl-labels ((add-path
             (path)
             (add-to-list
              'load-path (concat user-emacs-directory path))))
  (mapc #'add-path
        [ "core"
          "vendor"
          "vendor/use-package"
          "themes"]))

(load "startup.el")

(defvar package-list
  '(smex
    ido-completing-read+

    ivy
    counsel
    swiper
    anzu

    magit
    projectile
    dumb-jump
    exec-path-from-shell
    
    yafolding
    paredit
    rainbow-delimiters
    cider
    clojure-mode
    clojure-mode-extra-font-locking
    rust-mode
    elpy
    lua-mode

    tabbar
    git-gutter
    diminish
    base16-theme
    neotree
    )

  (require 'package))
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


(load "editing")
(load "tooling")
(load "navigation")
(load "ui")
(load "theme")
(load "misc")


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; BINDINGS

;; Unused binds
;;
;; C-o (insertline)
;; C-m (RET)
;; C-i (TAB)
;; C-t (transpose-chars)
;; C-z (suspend-frame)
;;
;; navigation bindings - could reuse for contextual actions
;; C-p
;; C-n
;; C-b
;; C-f
;;
;; maybe learn to use these
;; C-v (scroll-up)
;; M-v (scrol-down)
;; C-e (end)
;; C-a (begin)
;; C-d (forward-delete)
;;
;; undefined
;; M-p
;; M-n

;; Rebind candidates 
;;
;; other-window
;; projectile-find-file
;; counsel-git-grep
