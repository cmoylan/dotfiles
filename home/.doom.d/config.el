#+SETUPFILE: https://fniessen.github.io/org-html-themes/setup/theme-readtheorg.setup

(setq org-log-done t)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(load "/Users/cmoylan/quicklisp/clhs-use-local.el" t)

(after! treemacs
  (treemacs-icons-dired-mode))
