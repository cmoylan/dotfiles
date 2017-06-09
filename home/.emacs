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


;;                              ;;
;; ----- Global settings  ----- ;;
;;                              ;;
;; Make the default font a bit bigger
;; TODO: use different height on linux
(set-face-attribute 'default (selected-frame) :height 150)
(global-linum-mode t) ; Enable line numbering
(tool-bar-mode 0) ; Disable graphical toolbar
(menu-bar-mode 0) ; Disable menu bar
(electric-pair-mode 1) ; enable closing paren auto-insertion
(setq-default indent-tabs-mode nil) ; Use soft tabs
(setq js-indent-level 2) ; Use 2 spaces for javascript
(setq-default c-basic-offset 4) ; Use 4 spaces for CC-mode (c, c++, java)
(setq-default truncate-lines t) ; Enable line truncation rather than wrapping
(setq shell-file-name "/bin/bash") ; Use bash as the shell in emacs
(setq confirm-kill-emacs 'y-or-n-p) ; Ask for confirmation when quitting
(setq ruby-insert-encoding-magic-comment nil) ;; do not insert the encoding comment in utf-8 files
(setq recenter-positions '(top bottom)) ;; only recenter to top and bottom, ignore middle...i find it annoying


;;                                              ;;
;; ----- Automatically installed packages ----- ;;
;;                                              ;;
;; Install useful packages
(let ((package-list (list 'ws-butler 'helm 'rainbow-delimiters 'ivy
                          'projectile 'neotree 'base16-theme 'robe
                          'smart-mode-line 'exec-path-from-shell))
      (contents-refreshed 0))
  (dolist (package package-list )
   (unless (package-installed-p package)
     (unless (eq contents-refreshed 0)
       (package-refresh-contents)
       (setq contents-refreshed t))
     (package-install package))))


;;                                    ;;
;; ----- Package configurations ----- ;;
;;                                    ;;
(use-package exec-path-from-shell
  :init (exec-use-path-from-shell-initialize))

(use-package ws-butler
  :config (add-hook 'prog-mode-hook 'ws-butler-mode))

(use-package helm
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind
  (("C-x C-f" . helm-find-files)
   ("M-x" . helm-M-x)
   ))

(use-package rainbow-delimiters
  :config
  ;; Enable Rainbow Delimiters in 'programming-like' modes
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package projectile
  :config
  ;;(use-package grizzl)
  ;;(setq projectile-completion-system 'grizzl)
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode))

;; Org Mode
;;(load-user-file "org-config.el")

(use-package neotree
  :config
  (global-set-key [f2] 'neotree-toggle)

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

  (global-set-key [f8] 'neotree-project-dir))

;; testing out wanderlust
;;(autoload 'wl "wl" "Wanderlust" t)
(setq jabber-account-list
      '(("cmoylan@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))))
(setq jabber-vcard-avatars-retreive nil)
(setq jabber-roster-line-format " %c %-25n %u %-8s (%r)")

(use-package robe
  :config
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby)))

(use-package smart-mode-line
  :config
  (sml/setup))


;;
;; ----- auto-generated stuff follows ----- ;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
