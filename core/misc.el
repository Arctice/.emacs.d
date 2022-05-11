
;; changes *scratch* mode
(setq initial-major-mode 'fundamental-mode)

;; workaround for windows stupid
;; (sometimes, windows systems will refuse to open files
;;  through C-x C-f due to permission issues, but for
;;  whatever reason, the GUI dialog always works)
(when (eq system-type 'windows-nt)
  (global-set-key (kbd "C-o") 'menu-find-file-existing)
  (defadvice find-file-read-args (around find-file-read-args-always-use-dialog-box act)
    "Simulate invoking menu item as if by the mouse; see `use-dialog-box'."
    (let ((last-nonmenu-event nil))
      ad-do-it)))


(setq ;; X11 copy-paste interaction
      x-select-enable-clipboard t
      x-select-enable-clipboard-manager nil
      x-select-enable-primary t
      save-interprogram-paste-before-kill t

      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t
      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)


;; grab a list of feeds from my online notes and hand it to elfeed
;; requires s.el
(defun fetch-feeds ()
  (interactive)
  (setq elfeed-feeds
        (with-current-buffer
            (url-retrieve-synchronously "https://arc.birb.uk/shaarli/?E6vVow")
          (mapcar 'caddr
                  (s-match-strings-all
                   "\\(atom\\|rss\\),.+href=\"\\(https?://[^\\\"]*\\)"
                   (buffer-string))))))

;; unbinds xref-find-definitions, which is buggy in c++-mode
(global-unset-key (kbd "M-."))


