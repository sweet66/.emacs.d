;; Mac平台下交换 Option 和 Command 键。
(when (featurep 'cocoa)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta))

;;; ### Unset key ###
;;; --- 卸载按键
(lazy-load-unset-keys                   ;全局按键的卸载
  '("C-z" "s-x" "M-h"))


;;; ### auto-install ###
(lazy-load-global-keys
 '(
   ("C-s-x" . auto-install-from-emacswiki))
 "init-auto-install")


;;; ### Popweb ###
;;; --- Web翻译
(lazy-load-global-keys
 '((";" . popweb-dict-bing-input)
   ("y" . popweb-dict-bing-pointer))
 "init-popweb"
  "C-z")


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
(lazy-load-global-keys
 '(
   ("M-J" . watch-other-window-up)        ;向下滚动其他窗口
   ("M-K" . watch-other-window-down)      ;向上滚动其他窗口
   ("M-<" . watch-other-window-up-line)   ;向下滚动其他窗口一行
   ("M->" . watch-other-window-down-line) ;向上滚动其他窗口一行
   )
 "watch-other-window")



;;; ### Buffer Move ###
;;; --- 缓存移动
(lazy-load-set-keys
 '(
   ("C-z k" . beginning-of-buffer)      ;缓存开始
   ("C-z j" . end-of-buffer)            ;缓存结尾
   ))


;;; ### expand-region ###
(lazy-load-global-keys
 '(
   ("C-=" . er/expand-region))
 "expand-region")


(provide 'init-key)
