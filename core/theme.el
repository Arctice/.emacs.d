;; Color Themes
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


(add-to-list 'desktop-globals-to-save 'custom-enabled-themes)
(defun desktop-load-theme () "load custom theme" (interactive)
       (cond ((display-graphic-p)
       ;; graphical interface
       (load-theme 'solarized-dark t)
       )
      (t
       ;; solarized-theme breaks in terminal, so switch to this
       (load-theme 'tomorrow-night-bright t)
       )))

(desktop-load-theme)



;; font size
;; (set-face-attribute 'default nil :height 120)


;;font
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11" ))
;;(set-face-attribute 'default t :font "DejaVu Sans Mono-11" )


;; (setq solarized-distinct-fringe-background t)
;; (setq solarized-use-variable-pitch nil)
;; (setq solarized-high-contrast-mode-line nil)
;; (setq solarized-use-less-bold t)
;; (setq solarized-emphasize-indicators nil)
;; (setq solarized-scale-org-headlines nil)
;; ;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)
;; (load-theme 'solarized-dark t)

