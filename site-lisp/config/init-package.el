(setq package-archives 
      '(
	("melpa" . "https://melpa.org/packages/")
	("gun" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	))

(package-initialize)

(defun packages-require (&rest packs)
  "Install and load a package. If the package is not available install it automaticaly"
  (mapc (lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)
	    #'package-require
	    ))
	packs)
  )

(packages-require
 'paredit
 'rainbow-delimiters
 'company 
 )

(dolist (hook '(emacs-lisp-mode-hook lisp-interaction-mode-hook))
  (add-hook hook
	    (lambda ()
	      (paredit-mode t)
	      (rainbow-delimiters-mode t)
	      (show-paren-mode 1)
	      )))


(provide 'init-package)
