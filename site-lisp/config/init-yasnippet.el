(add-hook 'prog-mode-hook
          #'(lambda ()
              (require 'yasnippet)

              (defun get-git-user-name ()
                (interactive)
                (replace-regexp-in-string "\n$" "" (shell-command-to-string "git config --get user.name")))

              (defun get-git-user-email ()
                (interactive)
                (replace-regexp-in-string "\n$" "" (shell-command-to-string "git config --get user.email")))

              (add-to-list `yas/root-directory (concat sweet-emacs-root-dir "/snippets"))
              (yas-global-mode 1)

              ;; Disable yasnippet mode on some mode.
              (dolist (hook (list
                             'term-mode-hook
                             ))
                (add-hook hook #'(lambda () (yas-minor-mode -1))))
              ))

(provide 'init-yasnippet)
