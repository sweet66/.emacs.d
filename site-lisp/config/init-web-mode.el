(require 'web-mode)
(require 'highlight-matching-tag)

(highlight-matching-tag 1)

(add-hook 'web-mode-hook '(lambda ()
			    (setq web-mode-enable-auto-quoting nil)
			    (setq web-mode-tag-auto-close-style 2)
			    (setq web-mode-markup-indent-offset 2)
			    (setq web-mode-script-padding 0)
			    (setq web-mode-style-padding 0)))

