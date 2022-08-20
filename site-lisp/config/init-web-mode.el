(require 'web-mode)
(require 'js)
(require 'grammatical-edit)
(require 'instant-rename-tag)
(require 'highlight-matching-tag)

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; OS Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (featurep 'cocoa)
  ;; Initialize environment from user's shell to make eshell know every PATH by other shell.
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(setq web-mode-enable-auto-quoting nil) ;disable automatic insertion of double quotes, not easy to use if cursor in string

(highlight-matching-tag 1)

;; Emmit.
(setq web-mode-tag-auto-close-style 2) ;2 mean auto-close with > and </.
(setq web-mode-markup-indent-offset 2)

;; We-mode.
(lazy-load-set-keys grammatical-edit-key-alist web-mode-map)
(lazy-load-local-keys
 '(
   ("M-s-SPC" . web-mode-element-content-select)
   ("C-s-l" . web-mode-element-clone)
   ("C-M-SPC" . web-mode-mark-and-expand)
   ("C-:" . web-mode-comment-or-uncomment)
   ("C-M-SPC" . mark-sexp)
   ("M-R" . instant-rename-tag)
   )
 web-mode-map
 "web-mode-extension")

(provide 'init-web-mode)
