;; Recursively add all folders in ~/.emacs.d/lisp to load path
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load the new themes directory
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Load zenburn on start
(load-theme 'zenburn t)

;; Make the default font a bit bigger
(set-face-attribute 'default (selected-frame) :height 150)

;; Enable line numbering
(global-linum-mode t)

;; Disable graphical toolbar
(tool-bar-mode -1)

;; Enable whitespace butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; HELM
(require 'helm-config)
(helm-mode 1)

;; Enable rvm integration
;;(require 'rvm)
;;(setq rspec-use-rake-when-possible nil)
;; Use the ruby specified by .rvmrc or .ruby-version
;;(add-hook 'ruby-mode-hook
;;	  (lambda () (rvm-activate-corresponding-ruby)))

;; Enable rspec-mode
;;(require 'rspec-mode)

;; Use bash instead of the default shell
;;defadvice rspec-compile (around rspec-compile-around)
;; "Use BASH shell for running the specs because of ZSH issues."
;; (let ((shell-file-name "/bin/bash"))
;;   ad-do-it))
;;ad-activate 'rspec-compile)

;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(custom-safe-themes
;;   (quote
;;    ("0603fb5696ab4af05e7c8bb11498bd189bdb7930c7c88dd6ac1e5ec2fc3efb2b" default))))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" "0603fb5696ab4af05e7c8bb11498bd189bdb7930c7c88dd6ac1e5ec2fc3efb2b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
