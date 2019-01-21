;; enable narrowing
(put 'narrow-to-region 'disabled nil)

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
      x-select-enable-primary t
      save-interprogram-paste-before-kill t

      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t
      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)


;; read-only prompts in shell-like buffers
(setq comint-prompt-read-only t)


;; good names for gooder memorization
(defalias 'repl-elisp 'ielm)


(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))


(require 'diminish)
(diminish 'git-gutter-mode)
(diminish 'global-git-gutter-mode)
(diminish 'ivy-mode)
(diminish 'eldoc-mode)


;; startup dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "")
(setq dashboard-startup-banner nil)
(setq dashboard-items '((projects . 4)
                        (recents  . 25)
                        (projects . 50)))

