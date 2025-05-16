;; Haskell
;; (setq ghc-core-program "stack ghc")

;; From Haskell mode FAQ
;; (defun haskell-indentation-advice ()
;;  (when (and (< 1 (line-number-at-pos))
;;             (save-excursion
;;               (forward-line -1)
;;               (string= "" (s-trim (buffer-substring (line-beginning-position) (line-end-position))))))
;;    (delete-region (line-beginning-position) (point))))

;; (advice-add 'haskell-indentation-newline-and-indent
;;            :after 'haskell-indentation-advice)


;; Haskell with stack
;; http://www.rnowak.info/2015/10/getting-started-with-haskell-stack-and.html
(add-to-list 'exec-path "~/.stack/programs/x86_64-osx/ghc-8.0.2/bin")

(setq-default
 ;; helm-dash-candidate-format "%d %n (%t) %f"
 )
