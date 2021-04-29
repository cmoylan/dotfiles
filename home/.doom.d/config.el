(setq doom-theme 'doom-snazzy)

(if (string-equal system-type "gnu/linux")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 130))

(setq org-log-done t)

(setq org-roam-directory "~/Dropbox/org")
(setq org-roam-completion-system 'ivy)
(add-hook 'after-init-hook 'org-roam-mode)

(after! org-roam
        (map! :leader
            :prefix "n"
            :desc "org-roam" "l" #'org-roam
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
            :desc "org-roam-find-file" "f" #'org-roam-find-file
            :desc "org-roam-show-graph" "g" #'org-roam-show-graph
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-capture" "c" #'org-roam-capture ))

(use-package org-journal
      :bind
      ("C-c n j" . org-journal-new-entry)
      :custom
      (org-journal-dir org-roam-directory)
      (org-journal-date-prefix "#+TITLE: ")
      (org-journal-file-format "%Y-%m-%d.org")
      (org-journal-date-format "%A, %d %B %Y"))
    (setq org-journal-enable-agenda-integration t)

(if (file-directory-p "~/quicklisp")
    (progn
      (load (expand-file-name "~/quicklisp/slime-helper.el"))
      (setq inferior-lisp-program "sbcl")
      (load "~/quicklisp/clhs-use-local.el" t)))

(after! treemacs-icons-dired
  (treemacs-icons-dired-mode))

(use-package web-mode
  :mode "\\.erb\\'")
(add-hook! web-mode
           (setq web-mode-markup-indent-offset 2)
           (setq web-mode-css-indent-offset 2)
           (setq web-mode-code-indent-offset 2))

(defun hh/toggle-debugger (name)
  "Toggles a debugging statement depending on language."
  (interactive "p")

  (message "this goes to *Messages*")

  (let (message-log-max) ; minibuffer only, don't log to *Messages*
    (message "Debugger toggled"))
)
;(map! :leader
;  (:prefix-map ("a" . "applications")
;   (:prefix ("j" . "journal")
;    :desc "New journal entry" "j" #'hh/toggle-debugger)))

;(use-package enh-ruby-mode
;  :ensure t
;  :defer t
;  :config
;  (setq enh-ruby-deep-indent-paren nil)
;  (setq enh-ruby-add-encoding-comment-on-save nil)
;  :mode (("\\.rb\\'" . enh-ruby-mode)
;         ("\\.ru\\'" . enh-ruby-mode)
;         ("\\.gemspec\\'" . enh-ruby-mode)
;         ("Rakefile\\'" . enh-ruby-mode)
;         ("Gemfile\\'" . enh-ruby-mode)
;         ("Capfile\\'" . enh-ruby-mode)
;         ("Guardfile\\'" . enh-ruby-mode)))

;(setq flycheck-command-wrapper-function
;      (lambda (command)
;        (append '("bundle" "exec") command)))
