(require 'prettier-js)

(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(provide 'init-prettier)
