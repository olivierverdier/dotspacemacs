;; helm locate uses mdfind (https://github.com/xiaohanyu/oh-my-emacs/blob/fa06d2a9a2a7b1d78d49bb457c178efdba43d4e1/core/ome-completion.org)
(setq helm-locate-command
      (case system-type
        (gnu/linux "locate -i -r %s")
        (berkeley-unix "locate -i %s")
        (windows-nt "es %s")
        (darwin "mdfind -name %s %s")
        (t "locate %s")))

;; Julia
;; (julia-repl-set-terminal-backend 'vterm)
(setq lsp-julia-default-environment "~/.julia/environments/v1.11")

;; some leader-keys
;; (spacemacs/set-leader-keys
;;   "fi" 'evil-show-file-info
;;   ;; "gs" (defun ov/magit-status-move-far-right ()
;;   ;;        (interactive)
;;   ;;        (magit-status)
;;   ;;        (evil-window-move-far-right)
;;   ;;        )
;;   "tt" (defun ov/indent-tabs ()
;;          (interactive)
;;          (setq indent-tabs-mode t))
;;   )


;; Visual (wrapped) line indicators
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; Make sure bookmarks are saved from one install to another
(setq bookmark-default-file (expand-file-name (concat dotspacemacs-directory "bookmarks")))

(with-eval-after-load 'helm
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line))
