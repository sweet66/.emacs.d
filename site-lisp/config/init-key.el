;; Mac平台下交换 Option 和 Command 键。
(when (featurep 'cocoa)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta))


;;; ### Unset key ###
;;; --- 卸载按键
(lazy-load-unset-keys                   ;全局按键的卸载
 '("C-z" "s-x" "M-h"))


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
;;  "C-z")


;;; ### Aweshell ###
;;; --- 多标签式的shell
(lazy-load-global-keys
 '(
   ("s-n" . aweshell-new)
   ("s-h" . aweshell-toggle)
   ("s-x s-x" . aweshell-dedicated-toggle)
   )
 "aweshell")


;;; ### Awesome-Tab ###
;;; --- 多标签浏览
(lazy-load-set-keys
 '(
   ("s-j" . awesome-tab-ace-jump)        ;Ace jump
   ("M-7" . awesome-tab-backward-tab)    ;移动到后一个标签
   ("M-8" . awesome-tab-forward-tab)     ;移动到前一个标签
   ("M-9" . awesome-tab-backward-group)  ;移动到后一个标签组
   ("M-0" . awesome-tab-forward-group)   ;移动到前一个标签组
   ("<C-tab>" . awesome-tab-forward-tab) ;移动到后一个标签
   ("<C-S-tab>" . awesome-tab-backward-tab) ;移动到前一个标签
   ))
(lazy-load-global-keys
 '(
   ("M-&" . awesome-tab-backward-tab-other-window)
   ("M-*" . awesome-tab-forward-tab-other-window)
   ("M-s-7" . awesome-tab-select-beg-tab)
   ("M-s-8" . awesome-tab-select-end-tab)
   ("M-s-9" . awesome-tab-move-current-tab-to-beg)
   ("M-s-r" . awesome-tab-move-current-tab-to-right)
   ("M-s-e" . awesome-tab-move-current-tab-to-left)
   ("s-q" . awesome-tab-kill-other-buffers-in-current-group)
   ("s-Q" . awesome-tab-kill-all-buffers-in-current-group)
   ("s-w" . awesome-tab-keep-match-buffers-in-current-group)
   ("s-W" . awesome-tab-kill-match-buffers-in-current-group)
   )
 "awesome-tab")





;;; ### Functin key ###
;;; --- 功能函数
(lazy-load-set-keys
 '(
   ("<f5>" . emacs-session-save)        ;退出emacs
   ("C-4" . insert-changelog-date)      ;插入日志时间 (%Y/%m/%d)
   ("C-&" . switch-to-messages)         ;跳转到 *Messages* buffer
   ))


;;; ### Awesome-Pair ###
;;; --- 结构化编程
(lazy-load-unset-keys
 '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")
 awesome-pair-mode-map)                 ;卸载按键
(defvar awesome-pair-key-alist nil)
(setq awesome-pair-key-alist
      '(
        ;; 移动
        ("M-n" . awesome-pair-jump-left)
        ("M-p" . awesome-pair-jump-right)
        ;; 符号插入
        ("%" . awesome-pair-match-paren)       ;括号跳转
        ("(" . awesome-pair-open-round)        ;智能 (
        ("[" . awesome-pair-open-bracket)      ;智能 [
        ("{" . awesome-pair-open-curly)        ;智能 {
        (")" . awesome-pair-close-round)       ;智能 )
        ("]" . awesome-pair-close-bracket)     ;智能 ]
        ("}" . awesome-pair-close-curly)       ;智能 }
        ("\"" . awesome-pair-double-quote)     ;智能 "
        ("=" . awesome-pair-equal)             ;智能 =
        ("SPC" . awesome-pair-space)           ;智能 Space
        ;; 删除
        ("M-o" . awesome-pair-backward-delete) ;向后删除
        ("C-d" . awesome-pair-forward-delete)  ;向前删除
        ("C-k" . awesome-pair-kill)            ;向前kill
        ;; 包围
        ("M-\"" . awesome-pair-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
        ("M-[" . awesome-pair-wrap-bracket)       ;用 [ ] 包围对象
        ("M-{" . awesome-pair-wrap-curly)         ;用 { } 包围对象
        ("M-(" . awesome-pair-wrap-round)         ;用 ( ) 包围对象
        ("M-)" . awesome-pair-unwrap)             ;去掉包围对象
        ;; 跳出并换行缩进
        ("M-:" . awesome-pair-jump-out-pair-and-newline) ;跳出括号并换行
        ))
(lazy-load-set-keys awesome-pair-key-alist awesome-pair-mode-map)


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


;;; ### Flycheck ###
;;; --- 及时拼写检查
;; (lazy-load-global-keys
;;  '(
;;    ("M-s-j" . flycheck-next-error)      ;显示下一个错误
;;    ("M-s-k" . flycheck-previous-error)  ;显示上一个错误
;;    )
;;  "init-flycheck"
;;  )


(lazy-load-unset-keys                   ;全局按键的卸载
 '("M-." "M-,"))
(lazy-load-global-keys
 '(
   ("C-6" . lsp-bridge-lookup-documentation)
   ("C-7" . lsp-bridge-jump-back)
   ("C-8" . lsp-bridge-jump)
   ("M-," . lsp-bridge-jump-back)
   ("M-." . lsp-bridge-jump)
   ("C-9" . lsp-bridge-find-references)
   ("C-0" . lsp-bridge-rename)
   ("M-s-j" . lsp-bridge-jump-to-next-diagnostic) ;显示下一个错误
   ("M-s-k" . lsp-bridge-jump-to-prev-diagnostic) ;显示上一个错误
   ("M-s-l" . lsp-bridge-ignore-current-diagnostic) ;忽略当前的错误
   ("M-s-n" . lsp-bridge-popup-documentation-scroll-up) ;向下滚动文档
   ("M-s-p" . lsp-bridge-popup-documentation-scroll-down) ;向上滚动文档
   )
 "init-lsp-bridge")

(provide 'init-key)
