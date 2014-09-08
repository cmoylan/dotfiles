;; Recursively add all folders in ~/.emacs.d/lisp to load path
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; MELPA package repo
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Load the new themes directory
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Load zenburn on start
(load-theme 'zenburn t)

;; Make it easy to modularize configuration
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Make the default font a bit bigger
;; TODO: use different height on linux
(set-face-attribute 'default (selected-frame) :height 150)

;; Enable line numbering
(global-linum-mode t)

;; Disable graphical toolbar
(tool-bar-mode -1)

;; Use 2 spaces for javascript
(setq js-indent-level 2)

;; Enable line truncation rather than wrapping
(setq-default truncate-lines t)

;; Enable whitespace butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Enable HELM
(require 'helm-config)
(helm-mode 1)

;; Enable Rainbow Delimiters in 'programming-like' modes
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Projectile
;;(projectile-global-mode)
(add-hook 'after-init-hook #'projectile-global-mode)
(setq projectile-completion-system 'grizzl)

;; Org Mode
(load-user-file "org-config.el")


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
    ("bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "53c542b560d232436e14619d058f81434d6bbcdc42e00a4db53d2667d841702e" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "3ea3ee6739b8d5c0054e74d439f44073003a087a430ebc52ff6424c1c3bb1695" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" "0603fb5696ab4af05e7c8bb11498bd189bdb7930c7c88dd6ac1e5ec2fc3efb2b" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
