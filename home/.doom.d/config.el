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

(setq org-roam-directory "~/Dropbox/org")

(after! org-roam
        (map! :leader
            :prefix "n"
            :desc "org-roam" "l" #'org-roam
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
            :desc "org-roam-find-file" "f" #'org-roam-find-file
            :desc "org-roam-show-graph" "g" #'org-roam-show-graph
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-capture" "c" #'org-roam-capture))

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
