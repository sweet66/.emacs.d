(require 'auto-install)

(setq auto-install-directory (concat sweet-emacs-extension-dir "/sweet")) ;设置默认的安装目录
(setq auto-install-save-confirm nil)     ;不需要确认保存
(setq auto-install-install-compile nil)  ;默认不编译文件

(provide 'init-auto-install)
