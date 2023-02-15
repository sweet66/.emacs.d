(require 'elisp-demos)

(advice-add 'describe-function-1 :after #'elisp-demos-advice-describe-function-1)

(provide 'init-elisp-demos)
