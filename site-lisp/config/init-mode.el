;;; ### auto-mode-alist ###
;;; --- 绑定扩展名到特定的模式
(defun add-to-alist (alist-var elt-cons &optional no-replace)
  "Add to the value of ALIST-VAR an element ELT-CONS if it isn't there yet.
If an element with the same car as the car of ELT-CONS is already present,
replace it with ELT-CONS unless NO-REPLACE is non-nil; if a matching
element is not already present, add ELT-CONS to the front of the alist.
The test for presence of the car of ELT-CONS is done with `equal'."
  (let ((existing-element (assoc (car elt-cons) (symbol-value alist-var))))
    (if existing-element
      (or no-replace
        (rplacd existing-element (cdr elt-cons)))
      (set alist-var (cons elt-cons (symbol-value alist-var)))))
  (symbol-value alist-var))

(dolist (elt-cons '(
                     ("\\.markdown" . markdown-mode)
                     ("\\.md" . markdown-mode)
                     ("\\.stumpwmrc\\'" . lisp-mode)
                     ("\\.org\\'" . org-mode)
                     ("\\.cron\\(tab\\)?\\'" . crontab-mode)
                     ("cron\\(tab\\)?\\." . crontab-mode)
                     ("\\.py$" . python-mode)
                     ("SConstruct". python-mode)
                     ("\\.jl\\'" . lisp-mode)
                     ("\\.asdf\\'" . lisp-mode)
                     ("CMakeLists\\.txt\\'" . cmake-mode)
                     ("\\.cmake\\'" . cmake-mode)
                     ("\\.php\\'" . php-mode)
                     ("\\.vue" . web-mode)
                     ("\\.wxml" . web-mode)
                     ("\\.blade\\.php\\'" . web-mode)
                     ("\\.tpl\\.php\\'" . web-mode)
                     ("\\.erb\\'" . web-mode)
                     ("\\.mustache\\'" . web-mode)
                     ("\\.jsx$" . web-mode)
                     ("\\.tsx$" . web-mode)		     
                     ("\\.html?\\'" . web-mode)
                     ("\\.js.erb\\'" . js-mode)
                     ("\\.js$" . js-mode)
                     ("\\.wxs$" . js-mode)
                     ("\\.ts$" . typescript-mode)
                     ("\\.css\\'" . css-mode)
                     ("\\.wxss\\'" . css-mode)
                     ("\\.jade" . jade-mode)
                     ("\\.go$" . go-mode)
                     ("\\.rs$" . rust-mode)
                     ("\\.lua$" . lua-mode)
                     ("\\.pdf$" . pdf-view-mode)
                     ("\\.exs$" . elixir-mode)
                     ("\\.json$" . json-mode)
                     ("\\.dart$" . dart-mode)
                     ("\\.yml$" . yaml-mode)
                     ))
  (add-to-alist 'auto-mode-alist elt-cons))


;;; Mode load.
(autoload 'markdown-mode "init-markdown-mode")
(autoload 'web-mode "init-web-mode")
(autoload 'js-mode "init-web-mode")
(autoload 'css-mode "css-mode")
(autoload 'typescript-mode "typescript-mode")
(autoload 'yaml-mode "yaml-mode")
(autoload 'json-mode "json-mode")

;;; ### Auto-fill ###
;;; --- 自动换行
(setq default-fill-column 100)          ;默认显示 100列就换行
(dolist (hook (list
                'after-text-mode-hook
                'message-mode-hook
                ))
  (add-hook hook #'(lambda () (auto-fill-mode 1))))

(provide 'init-mode)
