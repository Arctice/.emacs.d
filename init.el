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
    haskell-mode
    rust-mode
    elpy
    lua-mode

    dired-subtree
    dired-collapse
    dired-ranger
    dired-rainbow

    tabbar
    git-gutter
    diminish
    base16-theme
    poet-theme
    dashboard

    sudo-edit
    rmsbolt
    elfeed
    ))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-archive-priorities
      '(("melpa-stable" . 8)
        ("melpa" . 9)
        ("gnu" . 2)))

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
(load "binds")
(load "misc")


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
