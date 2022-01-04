    (setq doom-theme 'doom-snazzy)

    (if (string-equal system-type "gnu/linux")
        (set-face-attribute 'default nil :height 120)
      (set-face-attribute 'default nil :height 130))

(defmacro csetq (sym val)
  `(funcall (or (get ',sym 'custom-set) 'set-default) ',sym ,val))

    (csetq org-log-done t)
    (csetq org-directory "~/Dropbox/org")

    (csetq org-roam-directory "~/Dropbox/org")
    (csetq org-roam-completion-system 'ivy)
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

    ;(require 'chruby)
    ;(chruby "ruby-2.7.4")
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

(add-to-list 'load-path "~/.doom.d/lisp/")
; add descendant directories
(let ((default-directory  "~/.doom.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(defun tt-get-heading-info ()
  "show org-heading-components result"
  (interactive)
  (let ((x (org-heading-components)))
    (with-output-to-temp-buffer "*xah temp out*"
      (print x))))

(defun tt-show-all-prop-keys ()
  "show all properties in buffer 2019-01-18"
  (interactive)
  (let ((x (org-buffer-property-keys )))
    (with-output-to-temp-buffer "*xah temp out*"
      (print x))))

(defun work/log-ticket (number description)
  (interactive)
  (message (number-to-string number))
  (message description)
  ; add a line under Task heading on work.org
  ;(with-current-buffer "work.org"
  ;  (org-element-parse-buffer))
  ; add a line under Task heading on work.org
  ;
  ; (write-region <STRING> nil <FILENAME> 'append)
  )

(defun bujo/finalize-month ()
  "Finalize the last month and create the next month"
  (interactive)
  (let* ((filename (downcase (format-time-string "%B-%Y.org")))
         (filepath (concat (file-name-as-directory org-directory) filename))
         (next-month)
         (next-year)
         (next-filename)
         (next-filepath))
    (setq next-month (read-string "Enter next month: "))

    (if (string= next-month "january")
        (setq next-year (read-string "Enter year: "))
      (setq next-year (format-time-string "%Y")))

    (setq next-filepath (concat (file-name-as-directory org-directory) next-month "-" next-year ".org" ))

    (if (file-exists-p next-filepath)
        (progn
          (message "file already exists")
          (user-error "file already exists")))

    (with-temp-file next-filepath
      (insert (concat "#+TITLE: " next-month " " next-year))
      (insert "\n\n")
      (insert "* Ongoing\n")
      (insert "* Tasks\n")
      (insert "* Notes\n")
      (insert "* Quotes\n")
      (insert "* Days\n")
      )
    ; TODO: copy over in-progress, incomplete items
    ; TODO: copy birthdays and holidays into events
    ; TODO: move monthly notes to central notes doc
    (message "got to the end")))

(defun bujo/new-day ()
  "Start a new day in the current month"
  (interactive)
  )
