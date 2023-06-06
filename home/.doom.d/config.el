(defun hh/toggle-debugger (name)
  "Toggles a debugging statement depending on language."
  (interactive "p")

  (message "this goes to *Messages*")

  (let (message-log-max) ; minibuffer only, don't log to *Messages*
    (message "Debugger toggled"))
)

(add-to-list 'load-path "~/.doom.d/lisp/")
; add descendant directories
(let ((default-directory  "~/.doom.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
  '("http://nullprogram.com/feed/"
    "https://hnrss.org/frontpage?points=100&comments=25"
    ))

(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

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
  (interactive "sTicket#: \nsDescription:")
  (message number)
  (message description)

  (write-region
   (concat "\n** STARTED " description " [#" number "]")
   nil
   (concat (file-name-as-directory org-directory) "work.org")
   'append))

(defun bujo/finalize-month ()
  "Finalize the last month and create the next month"
  ; DEPRECATED I just change the #+TITLE and move archive.org to <month>-<year>.org 1/24/2023
  (interactive)
  (let* ((filename (downcase (format-time-string "%B-%Y.org")))
         (filepath (concat (file-name-as-directory org-home) filename))
         (next-month)
         (next-year)
         (next-filename)
         (next-filepath))
    (setq next-month (read-string "Enter next month: "))

    (if (string= next-month "january")
        (setq next-year (read-string "Enter year: "))
      (setq next-year (format-time-string "%Y")))

    (setq next-filepath (concat (file-name-as-directory org-home) next-month "-" next-year ".org" ))

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

(defun nutrio/ratio (unknown known cal prot)
  "convert a known mass of cal/prot to a new mass"
  (interactive "nMass to calculate: \nnKnown mass: \nnCalories: \nnProtein:")
  (message (format "For %s, calories: %s, protein: %s"
                   unknown
                   (/ (* unknown cal) (float known))
                   (/ (* unknown prot) (float known)))))



(setq doom-theme 'kaolin-eclipse)

(if (string-equal system-type "gnu/linux")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 130))

(setq confirm-kill-emacs nil)

(fset 'src-block
   (kmacro-lambda-form [?i ?# ?+ ?B ?E ?G ?I ?N ?_ ?S ?R ?C ?  ?e ?m ?a ?c ?s ?- ?l ?i ?p backspace ?s ?p return ?# ?+ ?E ?N ?D ?_ ?S ?R ?C] 0 "%d"))

(defmacro csetq (sym val)
  `(funcall (or (get ',sym 'custom-set) 'set-default) ',sym ,val))

(global-set-key (kbd "C-*") 'evil-search-symbol-forward)
(global-set-key (kbd "C-#") 'evil-search-symbol-backward)

(global-set-key (kbd "C-x g") 'magit-status)

(defvar org-home "~/Dropbox/org")
(setq org-directory org-home)
(setq org-agenda-files (list org-home))

(setq org-refile-targets
      '(("archive.org" :maxlevel . 1)
        ("notes.org" :maxlevel . 3)
        ("current.org" :maxlevel . 1)
        ("calendar.org" :maxlevel . 1)
        ("projects.org" :maxlevel . 1)
        ("someday-maybe.org" :maxlevel . 1)
        ("tickler.org" :maxlevel . 1)))

(after! org
  (setq org-archive-location (concat org-home "/archive/archive.org::* From %s")))

(advice-add 'org-refile :after 'org-save-all-org-buffers)
(advice-add 'org-store-log-note :after 'org-save-all-org-buffers)

(after! org
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        org-agenda-block-separator #x2501
        org-agenda-compact-blocks t
        org-agenda-start-with-log-mode t))

(setq org-agenda-custom-commands
      '(("d" "Dashboard"
         ((agenda "" ((org-deadline-warning-days 7)))
          (todo "NEXT"
                ((org-agenda-overriding-header "Next Tasks")))
                                        ; need this to pull in the list of projects
          (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

        ("q" "Shopping list" tags-todo "+shopping")

        ("e" tags-todo "+easy"
         ((org-agenda-overriding-header "Low Effort Tasks")
          (org-agenda-max-todos 20)
          (org-agenda-files org-agenda-files)))
        ))



(after! org
  (setq org-capture-templates
        `(("t" "Todo" entry (file+headline ,(format "%s/inbox.org" org-home) "Tasks")
           "* TODO %?\n %U - %a\n %i"
           :empty-lines 1)

          ("j" "Journal" entry (file+datetree ,(format "%s/journal.org" org-home))
           "* %?\n\nEntered on %U from %i\n %a"
           :empty-lines 1)

          ("n" "Note" entry (file+headline ,(format "%s/inbox.org" org-home) "Notes")
           "* %?\n %U - %a\n %i")

          ("b" "Book" entry (file+headline ,(format "%s/books.org" org-home) "To read")
           "* %?\n %i")

          ("c" "Contact" entry (file ,(format "%s/contacts.org" org-home))
           "* %?\n %i")

          ("B" "Birthday" entry (file+headline ,(format "%s/calendar.org" org-home) "Birthdays")
           "* %?'s birthday\n %i")

          ("q" "Quote" entry (file ,(format "%s/quotes.org" org-home))
           "* %?\n %i")

          ("w" "Weight" table-line (file+headline ,(format "%s/fitness.org" org-home) "Weight")
           "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)


          )))

(setq cmdc/base-dir (format "%s/chrismoylandotcom/" org-home))
(setq cmdc/publish-dir "~/public_html/")

(setq cmdc/styles-and-scripts
      (concat
       "<link rel='stylesheet' href='/css/reset.css' />\n"
       "<link rel='stylesheet' href='/css/site.css' />\n"
       )
      )

(setq cmdc/website-header
      (let ((header-partial (concat (file-name-as-directory cmdc/base-dir) "_header.html")))
        (with-temp-buffer
          (insert-file-contents header-partial)
          (buffer-string))))

(setq cmdc/website-footer
      (let ((footer-partial (concat (file-name-as-directory cmdc/base-dir) "_footer.html")))
        (with-temp-buffer
          (insert-file-contents footer-partial)
          (buffer-string))))

(require 'ox-publish)
(setq org-publish-project-alist
      `(("chrismoylandotcom-pages"
         :base-directory ,cmdc/base-dir
         :base-extension "org"
         :publishing-directory ,cmdc/publish-dir
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :with-author nil
         :with-creator nil
         :with-toc nil
         :time-stamp-file nil
         :html-head-extra ,cmdc/styles-and-scripts
         :html-preamble ,cmdc/website-header
         :html-postamble ,cmdc/website-footer
         )
        ("chrismoylandotcom-static"
         :base-directory ,(format "%s/chrismoylandotcom/" org-home)
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory ,cmdc/publish-dir
         :recursive t
         :publishing-function org-publish-attachment )
        ("chrismoylandotcom" :components ("chrismoylandotcom-pages" "chrismoylandotcom-static"))))

(csetq org-log-done t)
(csetq org-log-into-drawer t)

(csetq org-roam-directory "~/Dropbox/org-roam")
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

;(use-package org-journal
;      :custom
;      (org-journal-dir org-roam-directory)
;      (org-journal-date-prefix "#+TITLE: ")
;      (org-journal-file-format "%Y-%m-%d.org")
;      (org-journal-date-format "%A, %d %B %Y"))
(setq org-journal-enable-agenda-integration t)



(setq org-web-tools-pandoc-sleep-time 1)

(setq org-tag-alist
      '((:startgroup)
        ; put mutually exclusive tags here
        (:endgroup)
        ("@house" . ?H)
        ("@work" . ?W)
        ("@garage" . ?G)
        ("@yard" . ?Y)
        ("@basement" . ?B)
        ("@computer" . ?C)
        ("reading" . ?r)
        ("shopping". ?s)
        ("easy" .?e)
                ))

(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "BACKLOG(b)" "READY(r)" "ACTIVE(a)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k)")
                )))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

(setq projectile-enable-caching nil)

;(if (file-directory-p "~/quicklisp")
;    (progn
;      (load (expand-file-name "~/quicklisp/slime-helper.el"))
;      (setq inferior-lisp-program "sbcl")
;      (load "~/quicklisp/clhs-use-local.el" t)))

;      ;("quicklisp-slime-helper")

(after! treemacs-icons-dired
  (treemacs-icons-dired-mode))

(use-package web-mode
  :mode "\\.erb\\'")
(add-hook! web-mode
           (setq web-mode-markup-indent-offset 2)
           (setq web-mode-css-indent-offset 2)
           (setq web-mode-code-indent-offset 2))
