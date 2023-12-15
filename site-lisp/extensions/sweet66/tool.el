;; 在新tab打开文件,如果文件已经打开，切换到那个文件
(defun new-tab-to-open-the-file (file &optional wildcard)
  (interactive
   (find-file-read-args "Find file in other tab: "
			(confirm-nonexistent-file-or-buffer)))
  (let ((exist-buffer (cl-dolist (buffer (buffer-list))
			(when (string-equal (expand-file-name file) (buffer-file-name buffer))
			  (tab-switch (buffer-name buffer))
			  (cl-return t)))))
    (when (not exist-buffer)
      (find-file-other-tab file))))
(global-set-key (kbd "C-z o") 'new-tab-to-open-the-file)

;; 加载当前buffer
(defun load-current-buffer ()
  (interactive)
  (save-buffer)
  (cond ((derived-mode-p 'sh-mode)
	 (message "执行shell文件: %s" (buffer-file-name))
         (shell-command (format "bash %s" (buffer-file-name))))
	((derived-mode-p 'js-mode)
	 (message "执行node文件: %s" (buffer-file-name))
	 (load-node-server (buffer-file-name))
	 )
	(t
	 (message "重新加载: %s" (buffer-file-name))
	 (load-file buffer-file-name))
	))
(global-set-key (kbd "C-z l") 'load-current-buffer)

;; 格式化当前buffer
(defun format-current-buffer ()
  (interactive)
  (save-buffer)
  (cond ((derived-mode-p 'web-mode)
	 (message "format: %s" (buffer-file-name))
         (shell-command (format "prettier -w %s" (buffer-file-name)))
	 (revert-buffer nil t))
	((derived-mode-p 'json-mode)
	 (message "format: %s" (buffer-file-name))
         (shell-command (format "prettier -w %s" (buffer-file-name)))
	 (revert-buffer nil t))
	(t
	 (revert-buffer nil t))
	))
(global-set-key (kbd "C-z f") 'format-current-buffer)

;; 启动node服务
(defun load-node-server(filePath)
  (interactive)
  (save-buffer)
  (ignore-errors (delete-process "node-subprocess"))
  (let ((server-path filePath))
    (make-process
     :buffer "*Messages*"
     :name "node-subprocess"
     :command (list "node" server-path)
     :filter (lambda (process output)
	       (message output))
     :sentinel (lambda (process event)
		 (message event))
     )))

(global-set-key (kbd "C-z r") 'load-node-server)


(provide 'tool)
