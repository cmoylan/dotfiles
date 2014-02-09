;;;
;;; BlackMustang emacs theme by Jarosław Rzeszótko
;;;
;;; Inspired by:
;;;
;;; IRBlack TextMate theme from Ted Werth:
;;; http://blog.toddwerth.com/entries/2
;;;
;;; Mustang color theme for Vim by Henrique C. Alves:
;;; http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
;;;

(deftheme black-mustang "BlackMustang color theme")

(defgroup black-mustang nil "BlackMustang color theme" :prefix "black-mustang-")

(defcustom black-mustang-vary-weights nil
  "Whether to use different font weights in some faces to indicate importance"
  :group 'black-mustang
  :type 'boolean)

(defun black-mustang-bold ()
  (if black-mustang-vary-weights '(:weight bold) '(:weight normal)))

(defun black-mustang-demibold ()
  (if black-mustang-vary-weights '(:weight demibold) '(:weight normal)))

(defun black-mustang-extralight ()
  (if black-mustang-vary-weights '(:weight extralight) '(:weight normal)))

(setq compilation-message-face 'default)

(let* (;;; Basic colors
       (bgcolor "#202020")
       (fgcolor "#f5f5f5")
       (prio-a-color "#fcff93")
       (prio-b-color "#ffd4a4")
       (prio-c-color "#b0c8f0")
       (prio-d-color "#f5b0b0")
       (prio-e-color "#cccccc")
       (prio-f-color "#bbbbbb")
       (highlight "#404040")
       ;;; Basic faces
       (prio-a `(:foreground ,prio-a-color))
       (prio-b `(:foreground ,prio-b-color))
       (prio-c `(:foreground ,prio-c-color))
       (prio-d `(:foreground ,prio-d-color))
       (prio-e `(:foreground ,prio-e-color))
       (prio-f `(:foreground ,prio-f-color))
       (error `(:foreground "#fc5161" ,@(black-mustang-bold)))
       (highlight-error `(:background "#ff2244" :foreground "#ffffff"))
       (warning `(:foreground "#ff8866" ,@(black-mustang-bold)))
       (hyperlink `(:foreground "#88ccff" :underline nil))
       (directory `(:background unspecified ,@prio-b :weight normal))
       ;;; Highlights
       (parens `(:background "#808080" :foreground ,prio-a-color))
       (region `(:background ,prio-b-color :foreground ,bgcolor))
       (isearch-primary `(:background ,prio-b-color :foreground ,bgcolor))
       (isearch-secondary `(:background "#505050" :foreground "#fafafa"))
       (current-line `(:background "#40404a"))
       (codehopper-project `(:background "#4f4f4f" :foreground ,prio-a-color))
       ;;; Interface faces
       (interface `(:background ,bgcolor))
       (text `(:background ,bgcolor :foreground ,fgcolor))
       (cursor `(:background ,prio-a-color))
       (widget `(:background "#404040" :foreground ,fgcolor :weight normal :box (:line-width 1 :color "#505050")))
       (widget-inactive `(:background "#383838" :foreground "#888888" ,@(black-mustang-extralight) :box (:line-width 1 :color "#3a3a3a")))
       (header `(:height 1.0)))

  (custom-theme-set-faces 'black-mustang

    ;;; Basic faces
    `(default ((t ,text)))
    `(cursor ((t ,cursor)))
    `(bold ((t ,@(black-mustang-bold))))
    `(highlight ((t ,current-line)))
    `(region ((t ,region)))
    `(fringe ((t ,interface)))
    `(minibuffer-prompt ((t ,text)))
    `(mode-line ((t ,widget)))
    `(mode-line-inactive ((t ,widget-inactive)))
    `(mode-line-buffer-id ((t (:foreground unspecified :weight unspecified))))
    `(link ((t ,hyperlink)))
    `(warning ((t ,warning)))
    `(success ((t ,@(black-mustang-demibold))))
    `(header-line ((t (:background "#202020" :foreground ,prio-a-color))))

    ;;; Font lock
    `(font-lock-function-name-face ((t ,prio-a)))
    `(font-lock-string-face ((t ,prio-b)))
    `(font-lock-keyword-face ((t ,prio-c)))
    `(font-lock-builtin-face ((t ,prio-d)))
    `(font-lock-constant-face ((t ,prio-e)))
    `(font-lock-comment-face ((t ,prio-f)))
    `(font-lock-warning-face ((t ,error)))
    `(font-lock-variable-name-face ((t ,text)))
    `(font-lock-type-face ((t ,text)))

    ;;; Python
    `(py-number-face ((t ,prio-d)))
    `(py-decorators-face ((t ,prio-e)))
    `(py-builtins-face ((t ,prio-e)))
    `(py-variable-name-face ((t ,text)))
    `(py-pseudo-keyword-face ((t ,text)))

    ;;; RHTML mode
    `(erb-out-face ((t (:background ,bgcolor))))
    `(erb-exec-face ((t (:background ,bgcolor))))
    `(erb-out-delim-face ((t (:background ,bgcolor :foreground ,fgcolor :weight bold))))
    `(erb-exec-delim-face ((t (:background ,bgcolor :foreground ,fgcolor :weight bold))))
    
    ;;; Search & replace
    `(isearch ((t ,isearch-primary)))
    `(match ((t ,isearch-primary)))
    `(lazy-highlight ((t ,isearch-secondary)))

    ;;; Ido mode
    `(ido-subdir ((t ,directory)))
    `(ido-first-match ((t (,@prio-a ,@(black-mustang-demibold)))))
    `(ido-only-match ((t (,@prio-a ,@(black-mustang-demibold)))))

    ;;; Helm
    `(helm-candidate-number ((t (,@prio-a :background unspecified))))
    `(helm-source-header ((t (,@header ,@prio-b :background "#252525" :weight unspecified :family unspecified))))
    `(helm-selection ((t ,current-line)))
    `(helm-ff-directory ((t ,directory)))
    `(helm-grep-file ((t ,hyperlink)))
    `(helm-grep-lineno ((t ,prio-a)))

    ;;; Magit
    `(magit-section-title ((t ,text)))
    `(magit-branch ((t ,prio-a)))
    `(magit-log-sha1 ((t ,prio-b)))
    `(magit-item-highlight ((t ,current-line)))

    ;;; Org mode
    `(org-level-1 ((t (,@prio-a :height 1.15))))
    `(org-level-2 ((t (,@prio-b :height 1.10))))
    `(org-level-3 ((t (,@prio-c :height 1.05))))
    `(org-level-4 ((t ,prio-d)))
    `(org-date ((t ,prio-c)))
    `(org-link ((t ,hyperlink)))

    ;;; Dired
    `(dired-marked ((t (,@prio-a ,@(black-mustang-bold)))))
    `(dired-directory ((t ,directory)))
    `(dired-perm-write ((t ,text)))

    ;;; Dired+
    `(diredp-dir-heading ((t (,@prio-a :background unspecified))))
    `(diredp-dir-priv ((t (,@directory :background unspecified))))
    `(diredp-date-time ((t ,prio-c)))
    `(diredp-number ((t ,text)))
    `(diredp-file-name ((t ,text)))
    `(diredp-file-suffix ((t ,text)))
    `(diredp-compressed-file-suffix ((t ,text)))
    `(diredp-read-priv ((t ,text)))
    `(diredp-write-priv ((t ,text)))
    `(diredp-exec-priv ((t ,text)))
    `(diredp-no-priv ((t ,text)))
    `(diredp-other-priv ((t ,text)))
    
    ;;; Eshell
    `(eshell-prompt ((t (,@prio-a :weight normal :underline nil))))
    `(eshell-ls-directory ((t ,directory)))
    `(eshell-ls-executable ((t (,@prio-a ,@(black-mustang-demibold)))))

    ;;; Comint
    `(comint-highlight-input ((t ,text)))

    ;;; Info
    `(info-xref ((t ,hyperlink)))
    `(info-xref-visited ((t ,hyperlink)))
    `(info-menu-star ((t ,text)))

    ;;; Compilation mode
    `(compilation-error ((t (,@error :weight normal))))
    `(compilation-info ((t (,@prio-a ,@(black-mustang-demibold)))))
    `(compilation-line-number ((t ,text)))
    `(compilation-column-number ((t ,text)))

    ;;; CodeHopper
    `(codehopper-mode-line-project-name ((t ,@codehopper-project)))

    ;;; Show paren mode
    `(show-paren-match ((t ,@parens)))

    ;;; Mic-paren mode
    `(paren-face-match ((t ,@parens)))
    `(paren-face-mismatch ((t (,@highlight-error ,@(black-mustang-bold)))))
    `(paren-face-no-match ((t (,@highlight-error ,@(black-mustang-bold)))))))
