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
    ;; 初始化全屏
    (require 'init-fullscreen)
    ;; 常规设置
    (require 'init-generic)
    ;; 加载主题
    (require 'init-themes)
    ;; 在mac下加载环境变量，防止插件找不到外部命令程序
    (when (featurep 'cocoa)
      (require 'cache-path-from-shell)
      (exec-path-from-shell-initialize))
    ;; 懒加载插件
    (require 'lazy-load)
    ;; 快捷键组
    (require 'one-key)
    ;; 增强的高亮括号
    (require 'init-highlight-parentheses)
    ;; 行号设置
    (require 'init-line-number)
    ;; 自动补全
    (require 'init-lsp-bridge)
    ;; 输入中文自动翻译
    (require 'init-insert-translated-name)
    ;; 按键绑定
    (require 'init-key)

    ;; 可以延后加载的
    (run-with-idle-timer
      1 nil
      #'(lambda ()
          (require 'init-markdown-mode)
          (require 'typescript-mode)
          (require 'init-editorconfig)
          (require 'init-proxy)
          (require 'init-magit)

          ;; Restore session at last.
          ;; (require 'init-session)
          ;; (emacs-session-restore)
          ))))

(provide 'init)
