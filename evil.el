(setq-default dotspacemacs-editing-style '(vim :variables
                                               vim-style-visual-feedback t
                                               vim-style-remap-Y-to-y$ nil
                                               vim-style-retain-visual-state-on-shift t
                                               vim-style-visual-line-move-text nil
                                               vim-style-enable-undo-region t ;; Added
                                               vim-style-ex-substitute-global t)
              )
(setq-default
 evil-want-C-i-jump t
 evil-want-Y-yank-to-eol t
 evil-want-visual-char-semi-exclusive t
 evil-want-abbrev-expand-on-insert-exit nil
 evil-move-cursor-back nil
 )


;; define-keys
;; (/) for page down/up
(define-key evil-normal-state-map (kbd "(") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "(") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd ")") 'evil-scroll-down)
(define-key evil-visual-state-map (kbd ")") 'evil-scroll-down)

(define-key evil-normal-state-map (kbd "K") 'evil-jump-item)
(define-key evil-visual-state-map (kbd "K") 'evil-jump-item)
(define-key evil-motion-state-map (kbd "K") 'evil-jump-item)

;; from https://www.reddit.com/r/emacs/comments/35eoq3/how_i_use_vim_transferring_to_emacs_spacemacs

(define-key evil-normal-state-map "H" "^")
(define-key evil-visual-state-map "H" "^")
(define-key evil-motion-state-map "H" "^")
(define-key evil-normal-state-map "L" "$")
(define-key evil-visual-state-map "L" "$")
(define-key evil-motion-state-map "L" "$")

;; open URL
;; (define-key evil-normal-state-map "go" 'goto-address-at-point)

(define-key evil-normal-state-map "!" 'spacemacs/alternate-buffer)

;; (define-key evil-normal-state-map "=" 'spacemacs/alternate-buffer-in-persp)

;; (define-key evil-insert-state-map "M-DEL" 'evil-delete-backward-word)

;; ;; From spacemacs docs
;; ;; Make evil-mode up/down operate in screen lines instead of logical lines
;; (define-key evil-motion-state-map "j" 'evil-next-visual-line)
;; (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; ;; Also in visual mode
;; (define-key evil-visual-state-map "j" 'evil-next-visual-line)
;; (define-key evil-visual-state-map "k" 'evil-previous-visual-line)


;; force SPC-Tab to switch between buffers in current persp
;; (seems to be a bug)
;; (spacemacs/set-leader-keys
;;   "TAB"  'spacemacs/alternate-buffer-in-persp)
