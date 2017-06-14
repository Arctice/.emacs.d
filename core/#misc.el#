
;; workaround for windows stupid
(when (eq system-type 'windows-nt)
  (global-set-key (kbd "C-o") 'menu-find-file-existing)
  (defadvice find-file-read-args (around find-file-read-args-always-use-dialog-box act)
    "Simulate invoking menu item as if by the mouse; see `use-dialog-box'."
    (let ((last-nonmenu-event nil))
      ad-do-it)))


(setq ;; X11 copy-paste interaction
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t

      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t
      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

(defalias 'repl-elisp 'ielm)


;; No need for ~ files when editing
(setq create-lockfiles nil)
 
