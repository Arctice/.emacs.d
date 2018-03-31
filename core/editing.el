;; General text editing tweaks


;; Search replacements
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'anzu-query-replace-regexp)

;; Replace region by typing
(delete-selection-mode 1)


;; comments
(defun toggle-comment ()
  "comment or uncomment current line, or the region if one is active"
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region
       (region-beginning)
       (region-end))
    (comment-or-uncomment-region
     (line-beginning-position)
     (line-end-position))
    ))
(global-set-key (kbd "C-;") 'toggle-comment) 


;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)
;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))


(use-package magit
  :bind ("C-c g" . 'magit-status)
  :config (message "Use-package: Loading magit...")
  :defer t)


;; http://www.emacswiki.org/emacs/SavePlace
(setq save-place-file (concat user-emacs-directory "places"))
(save-place-mode 1)


;; Don't use hard tabs
(setq-default indent-tabs-mode nil)
;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; shell scripts
(setq-default sh-basic-offset 4)
(setq-default sh-indentation 4)

;; Disable automatic indents on newline
;; (setq electric-indent-mode nil)

;; paredit
;; http://www.emacswiki.org/emacs/PareditCheatsheet
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)


;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


(setq-default c-basic-offset 4)

(load "setup-clojure")
(load "setup-python")

;; The default lisp-indent-function is broken when trying to indent :keywords properly. This fixes it. Thanks Fuco1
;; https://github.com/Fuco1/.emacs.d/blob/af82072196564fa57726bdbabf97f1d35c43b7f7/site-lisp/redef.el#L20-L94

(defun lisp-indent-function (indent-point state)
  "This function is the normal value of the variable `lisp-indent-function'.
       The function `calculate-lisp-indent' calls this to determine
       if the arguments of a Lisp function call should be indented specially.
       INDENT-POINT is the position at which the line being indented begins.
       Point is located at the point to indent under (for default indentation);
       STATE is the `parse-partial-sexp' state for that position.
       If the current line is in a call to a Lisp function that has a non-nil
       property `lisp-indent-function' (or the deprecated `lisp-indent-hook'),
       it specifies how to indent.  The property value can be:
       * `defun', meaning indent `defun'-style
         \(this is also the case if there is no property and the function
         has a name that begins with \"def\", and three or more arguments);
       * an integer N, meaning indent the first N arguments specially
         (like ordinary function arguments), and then indent any further
         arguments like a body;
       * a function to call that returns the indentation (or nil).
         `lisp-indent-function' calls this function with the same two arguments
         that it itself received.
       This function returns either the indentation to use, or nil if the
       Lisp function does not specify a special indentation."
  (let ((normal-indent (current-column))
        (orig-point (point)))
    (goto-char (1+ (elt state 1)))
    (parse-partial-sexp (point) calculate-lisp-indent-last-sexp 0 t)
    (cond
     ;; car of form doesn't seem to be a symbol, or is a keyword
     ((and (elt state 2)
           (or (not (looking-at "\\sw\\|\\s_"))
               (looking-at ":")))
      (if (not (> (save-excursion (forward-line 1) (point))
                  calculate-lisp-indent-last-sexp))
          (progn (goto-char calculate-lisp-indent-last-sexp)
                 (beginning-of-line)
                 (parse-partial-sexp (point)
                                     calculate-lisp-indent-last-sexp 0 t)))
      ;; Indent under the list or under the first sexp on the same
      ;; line as calculate-lisp-indent-last-sexp.  Note that first
      ;; thing on that line has to be complete sexp since we are
      ;; inside the innermost containing sexp.
      (backward-prefix-chars)
      (current-column))
     ((and (save-excursion
             (goto-char indent-point)
             (skip-syntax-forward " ")
             (not (looking-at ":")))
           (save-excursion
             (goto-char orig-point)
             (looking-at ":")))
      (save-excursion
        (goto-char (+ 2 (elt state 1)))
        (current-column)))
     (t
      (let ((function (buffer-substring (point)
                                        (progn (forward-sexp 1) (point))))
            method)
        (setq method (or (function-get (intern-soft function)
                                       'lisp-indent-function)
                         (get (intern-soft function) 'lisp-indent-hook)))
        (cond ((or (eq method 'defun)
                   (and (null method)
                        (> (length function) 3)
                        (string-match "\\`def" function)))
               (lisp-indent-defform state indent-point))
              ((integerp method)
               (lisp-indent-specform method state
                                     indent-point normal-indent))
              (method
               (funcall method indent-point state))))))))

(add-hook 'emacs-lisp-mode-hook
          (lambda () (setq-local lisp-indent-function #'lisp-indent-function)))
