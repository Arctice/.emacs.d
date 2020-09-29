;; solarized tweaks
(setq solarized-distinct-fringe-background t)
(setq solarized-high-contrast-mode-line nil)
(setq solarized-use-less-bold t)
(setq solarized-emphasize-indicators nil)
;; ;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

;; Color Themes
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


(setq term-supports-24bit
      (equal (getenv-internal "TERM" initial-environment)
             "xterm-24bit"))


(add-to-list 'desktop-globals-to-save 'custom-enabled-themes)
(defun desktop-load-theme () "load custom theme" (interactive)
       (cond ((display-graphic-p)
              ;; graphical interface
              (load-theme 'tomorrow-night-bright t)
              )
             (t
              ;; solarized-theme breaks in terminal, so switch to this
              (load-theme 'tomorrow-night t)
              )))

(desktop-load-theme)

;; summerfruit
;; atelier
;; poet
;; solarized
;; oceanicnext

;;font

(ignore-errors
  (progn 
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11" ))
    (set-face-attribute 'default t :font "DejaVu Sans Mono-11" )))

(when (not (eq system-type 'windows-nt))
  (setq git-gutter:modified-sign ">")
  (setq git-gutter:added-sign "+")
  (setq git-gutter:deleted-sign "-")
  (setq git-gutter:update-interval 1)
  (setq git-gutter:lighter " GitG")

  (set-face-attribute
   'git-gutter:added nil
   :foreground "light green")
  (set-face-attribute
   'git-gutter:modified nil
   :foreground "light sky blue"
   :background nil)
  (set-face-attribute
   'git-gutter:deleted nil
   :foreground "red"
   :bold t))

(eval-after-load 'swiper
  (lambda ()
    (set-face-attribute
     'swiper-match-face-2 nil
     :background "dark orchid"
     :foreground "cyan"
     :bold t)))
