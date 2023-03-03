;;; Require
(require 'yasnippet)
(yas-global-mode 1)
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)

;;; Code:

(setq acm-enable-quick-access t)
(setq lsp-bridge-enable-hover-diagnostic t)
(setq acm-backend-yas-match-by-trigger-keyword t)

(add-to-list 'lsp-bridge-multi-lang-server-extension-list '(("tsx") . "volar_emmet"))
(add-to-list 'lsp-bridge-multi-lang-server-extension-list '(("html") . "html_emmet"))

(global-lsp-bridge-mode)

;; 打开日志，开发者才需要
;; (setq lsp-bridge-enable-log t)

;; 融合 `lsp-bridge' `find-function' 以及 `dumb-jump' 的智能跳转
(defun lsp-bridge-jump ()
  (interactive)
  (cond
   ((eq major-mode 'emacs-lisp-mode)
    (let ((symb (function-called-at-point)))
      (when symb
        (find-function symb))))
   (lsp-bridge-mode
    (lsp-bridge-find-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-go))))

(defun lsp-bridge-jump-back ()
  (interactive)
  (cond
   (lsp-bridge-mode
    (lsp-bridge-find-def-return))
   (t
    (require 'dumb-jump)
    (dumb-jump-back))))

(setq lsp-bridge-get-single-lang-server-by-project
      (lambda (project-path filepath)
        ;; If typescript file include deno.land url, then use Deno LSP server.
        (save-excursion
          (when (string-equal (file-name-extension filepath) "ts")
            (dolist (buf (buffer-list))
              (when (string-equal (buffer-file-name buf) filepath)
                (with-current-buffer buf
                  (goto-char (point-min))
                  (when (search-forward-regexp (regexp-quote "from \"https://deno.land") nil t)
                    (return "deno")))))))))

(provide 'init-lsp-bridge)

;;; init-lsp-bridge.el ends here
