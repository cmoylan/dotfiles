;; MELPA package repo
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
 (require 'use-package))

;; Make it easy to modularize configuration
;;(defconst user-init-dir
;;  (cond ((boundp 'user-emacs-directory)
;;	 user-emacs-directory)
;;	((boundp 'user-init-directory)
;;	 user-init-directory)
;;	(t "~/.emacs.d/")))
;;
;;(defun load-user-file (file)
;;  (interactive "f")
;;  "Load a file in current user's configuration directory"
;;  (load-file (expand-file-name file user-init-dir)))

;; Make the default font a bit bigger
;; TODO: use different height on linux
(set-face-attribute 'default (selected-frame) :height 150)

(global-linum-mode t) ; Enable line numbering
(tool-bar-mode 0) ; Disable graphical toolbar
(menu-bar-mode 0) ; Disable menu bar
(setq-default indent-tabs-mode nil) ; Use soft tabs
(setq js-indent-level 2) ; Use 2 spaces for javascript
(setq-default c-basic-offset 4) ; Use 4 spaces for CC-mode (c, c++, java)
(setq-default truncate-lines t) ; Enable line truncation rather than wrapping


;; Install useful packages
(let ((package-list (list 'ws-butler 'helm 'rainbow-delimiters 'grizzl 'projectile 'neotree 'base16-theme))
      (contents-refreshed 0))
  (dolist (package package-list )
   (unless (package-installed-p package)
     (unless (contents-refreshed)
       (package-refresh-contents)
       (setq contents-refeshed t))
     (package-install package))))

;; Enable whitespace butler
(use-package ws-butler
  :config (add-hook 'prog-mode-hook 'ws-butler-mode))

;; Enable HELM
(use-package helm
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind
  (("C-x C-f" . helm-find-files)
   ("M-x" . helm-M-x)
   ))

;; Enable Rainbow Delimiters in 'programming-like' modes
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Projectile
;;(projectile-global-mode)
(use-package projectile
  :config
  (use-package grizzl)
  (setq projectile-completion-system 'grizzl)
  (projectile-global-mode))

;; Org Mode
;;(load-user-file "org-config.el")

;; Neotree
(use-package neotree
             :config (global-set-key [f2] 'neotree-toggle))
;; Set a defaule theme
;;(load-theme ' t)
