;; From https://deniskyashif.com/2023/08/28/task-management-using-emacs-and-org-mode/

(setq org-directory "~/Nextcloud/org")
(setq org-agenda-files '("~/Nextcloud/org"))
(setq org-default-notes-file "~/Nextcloud/org/tasks.org")
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROG(p)" "DONE(d)")))
(setq org-modern-todo-faces
      '(("PROG" . (:foreground "yellow" :weight bold))))
(setq org-todo-keyword-faces
      '(("PROG" . (:foreground "yellow" :weight bold))))
(setq org-startup-indented t)
;; from https://github.com/howardabrams/hamacs/blob/main/ha-capturing-notes.org
(defvar org-capture-templates (list))

(add-to-list 'org-capture-templates
             '("n" "Thought or Note"  entry
               (file org-default-notes-file "General Notes")
               "* %?\n\n  %i\n\n  See: %a" :empty-lines 1))

(add-to-list 'org-capture-templates
             '("t" "Task"  entry
               (file+olp org-default-notes-file "Tasks")
               "** %?\n\n  %i\n\n  See: %a" :empty-lines 1))

(add-to-list 'org-capture-templates
             '("c" "Currently clocked in task"))
(add-to-list 'org-capture-templates
             `("ci" "Item to Current Clocked Task" item
               (clock)
               "%?" :empty-lines 1))
(add-to-list 'org-capture-templates
             `("cc" "Contents to Current Clocked Task" plain
               (clock)
               "%i" :immediate-finish t :empty-lines 1))
(add-to-list 'org-capture-templates
             `("ck" "Kill-ring to Current Clocked Task" plain
               (clock)
               "%c" :immediate-finish t :empty-lines 1))

;; (let* ((base-font-color (face-foreground 'default nil 'default))
;;        (headline `(:inherit default :weight bold :foreground ,base-font-color)))
;;   (custom-theme-set-faces
;;    'user
;;    `(org-level-8 ((t ,headline)))
;;    `(org-level-7 ((t ,headline)))
;;    `(org-level-6 ((t ,headline)))
;;    `(org-level-5 ((t ,headline)))
;;    `(org-level-4 ((t (,@headline :height 1.0))))
;;    `(org-level-3 ((t (,@headline :height 1.1))))
;;    `(org-level-2 ((t (,@headline :height 1.2))))
;;    `(org-level-1 ((t (,@headline :height 1.3))))
;;    `(org-document-title ((t (,@headline :height 1.6 :underline nil))))))
