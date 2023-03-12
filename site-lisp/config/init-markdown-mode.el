(require 'markdown-mode)

(dolist (hook (list
                'markdown-mode-hook
                ))
  (add-hook hook
    #'(lambda ()
        (require 'olivetti)
        (olivetti-mode 1)
        (olivetti-set-width 120)
        )))

(provide 'init-markdown-mode)
