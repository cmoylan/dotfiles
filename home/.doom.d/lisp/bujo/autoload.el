;;; autoload.el --- Org Bullet Journal Utilities     -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Chris

;; Author: Chris <chris@o-O.attlocal.net>


; SPC m e b to eval buffer

(defun bujo/finalize-month-old ()
  (let (n)
    (setq n (read-number "Enter a number: "))
    (message "number was %s" n)
    ))

; figure out current file
; ask user if it is correct, allowing them to choose from list
