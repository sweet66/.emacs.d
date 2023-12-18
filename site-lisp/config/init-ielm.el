(require 'ielm)

(defun ielm/clear-repl ()
  "Clear current REPL buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (ielm-send-input)
    ))

(define-key inferior-emacs-lisp-mode-map
	    (kbd "M-RET")
	    #'ielm-return)

(define-key paredit-mode-map
	    (kbd "C-j")
	    nil)

(define-key inferior-emacs-lisp-mode-map
	    (kbd "C-j")
	    #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
	    (kbd "RET")
	    #'electric-newline-and-maybe-indent)

(define-key inferior-emacs-lisp-mode-map
	    (kbd "C-c C-q")
	    #'ielm/clear-repl
	    )
