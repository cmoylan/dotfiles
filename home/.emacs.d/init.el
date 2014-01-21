;; Recursively add all folders in ~/.emacs.d/lisp to load path
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load the color-theme plugin
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)

;; Make the default font a bit bigger
(set-face-attribute 'default (selected-frame) :height 140)
