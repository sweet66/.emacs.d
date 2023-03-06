(defun load-current-buffer ()
  (interactive)
  (save-buffer)
  (cond ((derived-mode-p 'sh-mode)
          (shell-command (format "bash %s" (buffer-file-name))))
    (t
      (load-file buffer-file-name))
    ))
(global-set-key (kbd "C-z l") 'load-current-buffer)

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


(global-set-key (kbd "C-z n") 'acm-doc-scroll-up)
(global-set-key (kbd "C-z p") 'acm-doc-scroll-down)
(global-set-key (kbd "C-z t") 'acm-doc-toggle)

;; 通过外部命令行工具扩展
(defun my-first-elisp-code ()
  (interactive)
  (message "%s" (shell-command-to-string "git status")))

(defun eaf-git-run (prompt command)
  (message prompt)
  (save-window-excursion
    (let ((output-content ""))
      (make-process
       :name "eaf-git-subprocess"
       :command command
       :filter (lambda (process output)
                 (setq output-content (format "%s%s\n" output-content output)))
       :sentinel (lambda (process event)
                   (message (string-trim output-content))
                   )))))

(defun eaf-git-pull ()
  (interactive)
  (eaf-git-run "Git Pull..." (list "git" "status")))


;; 函数变量赋值
(defun foo ()
  (let* ((a 1)
          (b (* a 2)))
    (message "%s" (+ a b))))


;; 读取输入
(defun interactive-example (file)
  (interactive "fRead file: ")
  (message "Hello %s" file))

(completing-read "Read test: " '("hello" "elisp" "programming"))


;; buffer 处理
(with-temp-buffer
  (insert "Hello")
  (buffer-string))

;; (with-current-buffer "test.el"
;;   (insert "Hello")
;;   (save-buffer))

(ignore-errors
  (require 'my-plugin.el))


;; 自定义mode
(define-derived-mode new-plugin-mode text-mode "new-plugin"
  (interactive)
  (kill-all-local-variables) ; 删除buffer下所有的
  (setq major-mode 'new-plugin-mode) ; 设置当前的mode为new-plugin-mode
  (setq mode-name "new-plugin") ; 设置mode的名称
  (new-plugin-highlight-keywords) ; 根据正则表达式提供语法高亮
  (use-local-map new-plugin-mode-map) ; 加载mode对应的快捷键
  (run-hooks 'new-plugin-mode-hook)) ; 加载mode对应的hook，注意new-plugin-mode-hook会自动生成

(defun new-plugin-highlight-keywords ()
  "Highlight keywords."
  ;; Add keywords for highlight.
  (font-lock-add-keywords
    nil
    '(
       ("regexp-string" . 'font-lock-constant-face) ; 当buffer内容匹配正则，就会自动按照font-lock-constans-face提供颜色高亮
       ))
  ;; Enable font lock.
  (font-lock-mode 1)) ; 开启语法高亮


(defvar new-plugin-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-m") #'new-plugin-function)   ; 绑定 new-plugin-function 函数到快捷键 C-m 上
    map)
  "Keymap used by `new-plugin-mode'.")


;; 字符串高亮
(defun highlight-text-property-example-string ()
  (defvar text-property-example-string "Hello world")
  (add-face-text-property 0 5 'font-lock-function-name-face 'append text-property-example-string)
  (insert text-property-example-string))

(defun highlight-overlay-example ()
  (set (make-local-variable 'overlay-var) (make-overlay (point) (point))) ; 创建overlay
  (overlay-put overlay-var 'face 'font-lock-function-name-face) ; 赋予颜色
  (move-overlay overlay-var 1 3) ; 显示overlay
  (delete-overlay overlay-var))  ; 删除overlay


;; 条件判断
(setq test2 "hello")
(cond ((< (length test2) 0)
        (message "branch 1"))
  ((string-prefix-p "hel" test2)
    (message "branch 2"))
  (t
    (message "branch 3"))
  )

(setq lang "elisp1")
(pcase lang
  ("elisp" (message "got elisp"))
  ("java" (message "got java"))
  ("golang" (message "got golang"))
  (_ (message "got nothing")))

;; 循环列表
(dolist (element '("a" "b" "c"))
  (message "Print: %s"element))

(cl-dolist (buffer (buffer-list))
  (when (ignore-errors (string-match-p "test" (buffer-file-name buffer)))
    (kill-buffer buffer)
    (cl-return 123)))


;; 获取光标处的内容,
(defun lsp-bridge-in-comment-p (&optional state)
  (ignore-errors
    (unless (or (bobp) (eobp))
      (save-excursion
        (or
          (nth 4 (or state (lsp-bridge-current-parse-state)))
          (eq (get-text-property (point) 'face) 'font-lock-comment-face))
        ))))

(defun lsp-bridge-in-string-p (&optional state)
  (ignore-errors
    (unless (or (bobp) (eobp))
      (save-excursion
        (and
          (nth 3 (or state (lsp-bridge-current-parse-state)))
          (not (equal (point) (line-end-position))))
        ))))

(defun lsp-bridge-current-parse-state ()
  (let ((point (point)))
    (beginning-of-defun)
    (when (equal point (point))
      (beginning-of-line))
    (parse-partial-sexp (point) point)))

(defun my-plugin-request-get (url)
  (interactive "s请输入url: ")
  (let (json)
    (url-retrieve (url-encode-url url)
      (lambda (status)
        (message "%s" status)
        (set-buffer-multibyte t)
        (goto-char (point-min))
        (when (not (string-match "200 OK" (buffer-string)))
          (error "Problem connecting to the server"))
        (re-search-forward "^$" nil 'move)
        (setq json (json-read-from-string (buffer-substring-no-properties (point) (point-max))))
        (create-file-buffer "quest-result")
        (with-current-buffer "quest-result"
          (insert (format "%s" json))
          (switch-to-buffer "quest-result"))))))

(defun auto-sequence (format start end)
  (interactive "sSequence format: \nnEnter start number: \nnEnter end number: ")
  (progn
    (kmacro-set-format format)
    (kmacro-set-counter start)
    (while (< start (+ 1 end))
      (execute-kbd-macro (read-kbd-macro "<f3> RET"))
      (setq start (+ 1 start)))
    ))

(kmacro-set-format "abcccc%d")
(execute-kbd-macro (read-kbd-macro "<f3> RET"))

(fset 'test-marco
  (kmacro-lambda-form [?a ?b ?c] 0 "abcccc%d"))


(provide 'my-plugin)
