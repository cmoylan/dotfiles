;; Recursively add all folders in ~/.emacs.d/lisp to load path
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load the color-theme plugin
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-anothermonokai)
(require 'color-theme-solarized)
(color-theme-solarized-light)

;; Make the default font a bit bigger
(set-face-attribute 'default (selected-frame) :height 140)

;; Enable line numbering
(global-linum-mode t)

;; Disable graphical toolbar
(tool-bar-mode -1)

;; Enable whitespace butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Enable rspec-mode
(require 'rspec-mode)

;; Use bash instead of the default shell
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)
