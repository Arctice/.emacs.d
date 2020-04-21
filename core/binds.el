
;; <C-z> originally 'suspend-frame
(global-set-key (kbd "C-z") 'counsel-git-grep)
(global-set-key (kbd "C-c C-g") 'counsel-grep)

;; <C-t> originally 'transpose-chars
(global-set-key (kbd "C-t") 'pop-to-mark-command)


(global-set-key (kbd "C-S-<up>") 'scroll-down-line)
(global-set-key (kbd "C-S-<down>") 'scroll-up-line)

;; Unused binds
;; C-o (insertline)
;; C-m (RET)
;; C-i (TAB)
;; C-c *


;; UNICODE
(mapc
 (lambda (args) (define-key 'iso-transl-ctl-x-8-map (car args) (cadr args)))
 '(("a" [?α])
   ("b" [?β])
   ("g" [?γ])
   ("G" [?Γ])
   ("d" [?δ])
   ("D" [?Δ])
   ("t" [?θ])
   ("l" [?λ])
   ("p" [?π])
   ("s" [?σ])
   ("S" [?Σ])
   ("f" [?φ])
   ("o" [?ω])
   ("O" [?Ω])

   ("A" [?∀])
   ("E" [?∃])
   ("e" [?∈])
   ("." [?·])
   ))
