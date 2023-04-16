(require 'neotree)

(defun neotree-open-current-buffer (&optional path)
  (interactive "P")
  (if (neo-global--window-exists-p)
    (neotree-hide)
  (let* ((file-path (or path (buffer-file-name)))
	 (git-root-dir (magit-toplevel (or file-path default-directory))))
    (neo-global--open-dir (or git-root-dir default-directory))
    (neo-global--with-window
      (message file-path)
      (neo-buffer--select-file-node file-path t)))))

(defun neotree-open-file-in-tab (&optional arg)
  (interactive "P")
  (neo-buffer--execute arg '(lambda (full-path &optional arg)
			      (neo-global--select-mru-window arg)
			      (find-file-other-tab full-path)
			      (neotree-open-current-buffer full-path)
			      (select-window (get-mru-window))) 'neo-open-dir))

(global-set-key (kbd "C-c h") 'neotree-open-current-buffer)
(global-set-key (kbd "C-c t") 'neotree-open-file-in-tab)

(setq neo-theme 'classic)

(provide 'init-neotree)
