;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here



;; Org mode
(setq org-log-done t)


;; Treemacs config
(treemacs-icons-dired-mode)


;; Slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; set robe-mode in ruby
;; trying ramdon stuff for ruby code navigation
(add-hook 'ruby-mode-hook 'robe-mode)
;;(projectile-rails-global-mode)


;;; Centaur Tabs
;(use-package centaur-tabs
;  :demand
;  :config
;  (centaur-tabs-mode t)
;  :bind
;  (:map evil-normal-state-map
;    ("g t" . centaur-tabs-forward)
;    ("g T" . centaur-tabs-backward)))
;
;(setq centaur-tabs-set-icons t)            ; show icons
;(setq centaur-tabs-cycle-scope 'tabs)      ; only cycle through tabs in current group
;;(centaur-tabs-group-by-projectile-project) ; group tabs by projectile project
;
;;; hide certain buffers
;(defun centaur-tabs-hide-tab (x)
;  (let ((name (format "%s" x)))
;(or
; (string-prefix-p "*epc" name)
; (string-prefix-p "*helm" name)
; (string-prefix-p "*Compile-Log*" name)
; (string-prefix-p "*lsp" name)
; (and (string-prefix-p "magit" name)
;      (not (file-name-extension name))))))
