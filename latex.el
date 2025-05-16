(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("scrartcl"
                 "\\documentclass{scrartcl}
[NO-PACKAGES]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


;; Add custom evil-surround pair for LaTeX inline math

(with-eval-after-load 'evil-surround
  (setq-default evil-surround-pairs-alist
                (push '(?m . ("\\(" . "\\)")) evil-surround-pairs-alist))
  )

;; use xelatex by default
(setq-default
 TeX-engine 'xetex
 org-latex-compiler "xelatex"

 ;; LaTeX
 ;; hidden auto folder
 TeX-auto-local ".auto/"
 )
