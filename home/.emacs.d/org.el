;; --- Configuration variables
;; Tell org where to find info for the agenda
;; TODO change this based on system type...maybe
(setq org-agenda-files
     (quote ("/Volumes/O_O/gtd.org"
	     "/Volumes/O_O/dates.org")))

;; Set some agenda options
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-todo-ignore-deadlines t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-with-date t)

;; Set files for refiling
(setq org-refile-targets
      (quote
       (("gtd.org" :maxlevel . 1)
	("someday-maybe.org" :level . 1)
	("done.org" :level . 1))))

;; Might want to implement these at some point
;;(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))

;; Shortcuts
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
