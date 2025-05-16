;; Theming
(setq-default
 theming-modifications
 '((material
    (font-lock-function-name-face :weight semibold)
    (font-lock-comment-face :slant italic :weight ultralight)
    (font-lock-string-face :slant italic)
    (font-lock-doc-face :slant italic :weight ultralight)
    (font-lock-keyword-face :weight bold)
    (font-lock-constant-face :weight semibold)
    (font-lock-builtin-face :weight semibold)
    (fixed-pitch :weight ultralight)
    (helm-selection :underline t)
    ;; (company-tooltip-common :inherit company-tooltip :weight bold :underline nil)
    ;; (company-tooltip-common-selection :inherit company-tooltip-selection :weight bold :underline t)
    (company-tooltip-selection  :foreground "DarkOrange1")
    (company-tooltip :weight normal)
    ))
 )

(load-theme 'material t)

;; (font-lock-keyword-face :foreground "dark cyan" :weight bold)
;; (helm-selection :underline t :background "#2e2e2e")
;; (default :background "#2a2a2a")
;; (hl-line :background "Black")
;; (helm-ff-directory :weight bold  :foreground "forest green")

;; (helm-ff-file :inherit nil)
;; '(font-lock-comment-face ((t (:foreground "#6aaf50" :slant italic))))
;; '(font-lock-keyword-face ((t (:foreground "dark cyan" :weight bold))))
;; '(helm-ff-directory ((t (:foreground "forest green" :weight bold))))
;; '(helm-selection ((t (:background "dark red" :distant-foreground "black"))))
;; '(hl-line ((t (:background "Black"))))
