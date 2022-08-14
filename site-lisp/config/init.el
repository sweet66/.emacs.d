;; 加速配置。
(require 'init-accelerate)

;; 字体设置
(require 'init-font)

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  ;; 定义一些启动目录，方便下次迁移修改
  (defvar sweet-emacs-root-dir (file-truename "~/.emacs.d/site-lisp"))
  (defvar sweet-emacs-config-dir (concat sweet-emacs-root-dir "/config"))
  (defvar sweet-emacs-extension-dir (concat sweet-emacs-root-dir "/extensions"))

  (with-temp-message ""    ;抹掉插件启动的输出
    (require 'init-fullscreen)

    ;; 常规设置
    (require 'init-generic)
    ;; (require 'lazycat-theme)
    ;; (lazycat-theme-load-dark)
    (require 'init-themes)

    ;; 在mac下加载环境变量，防止插件找不到外部命令程序
    (when (featurep 'cocoa)
      (require 'cache-path-from-shell))
    ;; 懒加载插件
    (require 'lazy-load)
    ;; 快捷键组
    (require 'one-key)
    ;; 显示行数
    (require 'display-line-numbers)

    ;; 增强的高亮括号
    (require 'init-highlight-parentheses)
    ;; 更改mode-line
    ;; (require 'init-awesome-tray)
    ;; 行号设置
    (require 'init-line-number)
    ;; lsp 补全
    (require 'init-lsp-bridge)
    ;; 自动保存
    (require 'init-auto-save)
    ;; 绑定扩展名到特定的模式
    (require 'init-mode)
    ;; 按键绑定
    (require 'init-key)

    ;; 可以延后加载的
    (run-with-idle-timer
      1 nil
      #'(lambda ()
          (require 'init-yasnippet)
          (require 'init-markdown-mode)
          ;; 括号自动补全
          ;; (require 'init-awesome-pair)
          ;; 添加editorconfig
          (require 'init-editorconfig)

          (require 'init-eaf)
          (require 'init-proxy)

          ;; Restore session at last.
          (require 'init-session)
          (emacs-session-restore)

          ;; tab标签打开buffer
          (require 'init-awesome-tab)
          ))))


(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "localhost:8118")
      ("https" . "localhost:8118")))

(provide 'init)
