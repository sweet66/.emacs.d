(require 'highlight-parentheses)

(setq hl-paren-colors '("DarkOrange" "DeepSkyBlue" "DarkRed"))
;;增强的括号高亮
(add-hook 'find-file-hook 'highlight-parentheses-mode t)

(provide 'init-highlight-parentheses)
