(one-key-create-menu
 "DIRECTORY"
 '(
   (("h" . "Home") . (lambda () (interactive) (find-file "~/")))
   (("b" . "Book") . (lambda () (interactive) (find-file "~/book")))
   (("c" . "Config") . (lambda () (interactive) (find-file sweet-emacs-config-dir)))
   ((";" . "Extension") . (lambda () (interactive) (find-file "~/.emacs.d/site-lisp/extensions")))
   (("l" . "Lazycat Emacs") . (lambda () (interactive) (find-file "~/github_project/other/lazycat-emacs")))
   (("n" . "Notes") . (lambda () (interactive) (find-file "~/github_project/notes")))
   (("B" . "Blog") . (lambda () (interactive) (find-file "~/github_project/blog/sweet66.github.io"))) 
   )
 t)

(provide 'init-one-key)
