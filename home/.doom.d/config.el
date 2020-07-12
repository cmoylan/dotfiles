(setq doom-theme 'doom-opera)

(use-package! golden-ratio
  :after-call pre-command-hook
  :config
  (golden-ratio-mode +1)
  ;; Using this hook for resizing windows is less precise than
  ;; `doom-switch-window-hook'.
  (remove-hook 'window-configuration-change-hook #'golden-ratio)
  (add-hook 'doom-switch-window-hook #'golden-ratio))

(if (string-equal system-type "gnu/linux")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 100))

(setq org-log-done t)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(load "/Users/cmoylan/quicklisp/clhs-use-local.el" t)

(after! treemacs-icons-dired
  (treemacs-icons-dired-mode))

(add-hook! web-mode
           (setq web-mode-markup-indent-offset 2)
           (setq web-mode-css-indent-offset 2)
           (setq web-mode-code-indent-offset 2))

(setenv "PATH" (concat (getenv "PATH") ":~/go/bin"))
(setq exec-path (append exec-path '("~/go/bin")))
