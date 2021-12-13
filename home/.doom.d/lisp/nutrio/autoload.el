;;; autoload.el -*- lexical-binding: t; -*-

; SPC m e b to eval buffer

(defun nutrio/log ()
  (interactive)
  (let (n)
    (setq n (read-number "Enter a number: "))
    (message "number was %s" n)
    ))

(defun nutrio/stats ()
  ;(interactive)
  (message "----Hey-.-.-.-.-..-01!"))

; ask the user for input
; log to a file
; show totals for a day
