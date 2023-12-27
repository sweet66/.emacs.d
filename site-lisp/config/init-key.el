;; Mac平台下交换 Option 和 Command 键。
(when (featurep 'cocoa)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta))

;;; ### Unset key ###
;;; --- 卸载按键
(lazy-load-unset-keys  ;全局按键的卸载
  '("C-z" "s-x" "M-h"))

;;; ### auto-install ###
;; (lazy-load-global-keys
;;  '(
;;    ("C-s-x" . auto-install-from-emacswiki))
;;  "init-auto-install")

;;; ### Popweb ###
;;; --- Web翻译
(lazy-load-global-keys
 '((";" . popweb-dict-youdao-input)
   ("y" . popweb-dict-youdao-pointer))
 "init-popweb"
  "C-z")

;;; ### Insert translated name ###
;;; --- 写中文翻译成英文函数名、 变量名
(lazy-load-global-keys
 '(
    ("," . insert-translated-name-insert-with-underline)
    ("." . insert-translated-name-insert-with-camel)
    ("-" . insert-translated-name-insert-with-line)
   )
 "insert-translated-name"
 "C-z"
 )
(lazy-load-global-keys
 '(
   ("s-i" . insert-translated-name-insert)
   )
 "init-insert-translated-name")

;;; ### Sdcv ###
;;; --- 星际译王命令行
;; (lazy-load-global-keys
;;  '(("p" . sdcv-search-pointer)          ;光标处的单词, buffer显示
;;    ("y" . sdcv-search-pointer+)         ;光标处的单词, tooltip显示
;;    ("i" . sdcv-search-input)            ;输入的单词, buffer显示
;;    (";" . sdcv-search-input+))
;;  "init-sdcv"
;;   "C-z")

;;; ### Functin key ###
;;; --- 功能函数
(lazy-load-set-keys
 '(
   ("<f5>" . emacs-session-save)        ;退出emacs
   ("C-4" . insert-changelog-date)      ;插入日志时间 (%Y/%m/%d)
   ("C-&" . switch-to-messages)         ;跳转到 *Messages* buffer
   ))

;;; ### Watch other window ###
;;; --- 滚动其他窗口
;; (lazy-load-global-keys
;;  '(
;;    ("M-J" . watch-other-window-up)        ;向下滚动其他窗口
;;    ("M-K" . watch-other-window-down)      ;向上滚动其他窗口
;;    ("M-<" . watch-other-window-up-line)   ;向下滚动其他窗口一行
;;    ("M->" . watch-other-window-down-line) ;向上滚动其他窗口一行
;;    )
;;  "watch-other-window")

;;; ### Buffer Move ###
;;; --- 缓存移动
;; (lazy-load-set-keys
;;  '(
;;    ("C-z k" . beginning-of-buffer)      ;缓存开始
;;    ("C-z j" . end-of-buffer)            ;缓存结尾
;;    ))

;;; ### expand-region ###
(lazy-load-global-keys
 '(
   ("C-=" . er/expand-region))
  "expand-region")

;;; ### lsp-bridge ###
;;; --- 代码语法补全
;; (lazy-load-global-keys
;;  '(
;;     ("M-r" . lsp-bridge-toggle-sdcv-helper) ;英文助手
;;     ("C-7" . lsp-bridge-jump-back) ;回到上一个跳转的位置
;;     ("C-8" . lsp-bridge-jump) ;跳转到定义的位置
;;     ("M-," . lsp-bridge-code-action) ;弹出代码修复菜单
;;     ("M-." . lsp-bridge-find-references) ;查找代码引用
;;     ("C-9" . lsp-bridge-popup-documentation) ;查看光标处的文档
;;     ("C-0" . lsp-bridge-rename) ;重命名
;;     ("M-s-j" . lsp-bridge-diagnostic-jump-next) ;显示下一个错误
;;     ("M-s-k" . lsp-bridge-diagnostic-jump-prev) ;显示上一个错误
;;     ("M-s-l" . lsp-bridge-diagnostic-ignore)    ;忽略当前的错误
;;     ("M-s-u" . lsp-bridge-diagnostic-copy)      ;拷贝诊断信息
;;     ("M-s-n" . lsp-bridge-popup-documentation-scroll-up) ;向下滚动文档
;;     ("M-s-p" . lsp-bridge-popup-documentation-scroll-down) ;向上滚动文档
;;     ("M-s-[" . acm-doc-scroll-up) ;acm doc文档向上滚动
;;     ("M-s-]" . acm-doc-scroll-down) ;acm doc文档下滚动
;;    )
;;  "init-lsp-bridge")

;;; ### Toolkit ###
;;; --- 工具函数
(lazy-load-set-keys
 '(
   ("M-o" . one-key-menu-directory)   ;目录打开菜单
   ("M-;" . comment-dwim)
   ))

(provide 'init-key)
