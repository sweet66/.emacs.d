(require 'magit)


(setq magit-git-global-arguments '("--no-pager"))
(add-hook 'magit-mode-hook
          (lambda ()
            (setq-local global-git-commit-mode nil)))


(defun my-magit-status-format-line (args)
  (let* ((magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
         (line (apply (car args) (cdr args))))
    (if (string-match "^\\(.+\\)\\(.+\\)$" line)
        (concat (match-string 1 line)
                (propertize (match-string 2 line) 'face 'magit-log-date)))
    line))

(advice-add 'magit-status-format-line :filter-return #'my-magit-status-format-line)


(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
    "~/.emacs.d/site-lisp/extensions/magit/docs/"))


(provide 'init-magit)
