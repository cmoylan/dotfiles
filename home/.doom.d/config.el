(setq doom-theme 'doom-opera)

;;(use-package! golden-ratio
;;  :after-call pre-command-hook
;;  :config
;;  (golden-ratio-mode +1)
;;  ;; Using this hook for resizing windows is less precise than
;;  ;; `doom-switch-window-hook'.
;;  (remove-hook 'window-configuration-change-hook #'golden-ratio)
;;  (add-hook 'doom-switch-window-hook #'golden-ratio))

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
            :desc "org-roam-capture" "c" #'org-roam-capture))

(defun org-cycle-hide-drawers (state)
  "Re-hide all drawers after a visibility state change."
  (when (and (derived-mode-p 'org-mode)
             (not (memq state '(overview folded contents))))
    (save-excursion
      (let* ((globalp (memq state '(contents all)))
             (beg (if globalp
                      (point-min)
                    (point)))
             (end (if globalp
                      (point-max)
                    (if (eq state 'children)
                        (save-excursion
                          (outline-next-heading)
                       (point))
                     (org-end-of-subtree t)))))
        (goto-char beg)
        (while (re-search-forward org-drawer-regexp end t)
          (save-excursion
            (beginning-of-line 1)
            (when (looking-at org-drawer-regexp)
              (let* ((start (1- (match-beginning 0)))
                     (limit
                       (save-excursion
                         (outline-next-heading)
                           (point)))
                     (msg (format
                            (concat
                              "org-cycle-hide-drawers:  "
                              "`:END:`"
                              " line missing at position %s")
                            (1+ start))))
                (if (re-search-forward "^[ \t]*:END:" limit t)
                  (outline-flag-region start (point-at-eol) t)
                  (user-error msg))))))))))

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
      ;(setq inferior-lisp-program "sbcl")
      (load "/Users/cmoylan/quicklisp/clhs-use-local.el" t)))

(after! treemacs-icons-dired
  (treemacs-icons-dired-mode))

(use-package web-mode
  :ensure t
  :mode "\\.erb\\'")
(add-hook! web-mode
           (setq web-mode-markup-indent-offset 2)
           (setq web-mode-css-indent-offset 2)
           (setq web-mode-code-indent-offset 2))

; TODO put this behind a flag
;(setenv "PATH" (concat (getenv "PATH") ":~/go/bin"))
;(setq exec-path (append exec-path '("~/go/bin")))

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
