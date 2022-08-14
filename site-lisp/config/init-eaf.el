(require 'eaf)
(require 'eaf-git)


(setq eaf-proxy-type "socks5")
(setq eaf-proxy-host "127.0.0.1")
(setq eaf-proxy-port "1080")


(one-key-create-menu
 "GIT"
 '(
   (("s" . "Git status") . eaf-open-git)
   (("u" . "Git push to remote") . eaf-git-push)
   (("i" . "Git pull") . eaf-git-pull)
   (("c" . "Git clone") . eaf-git-clone)
   (("h" . "Git history") . eaf-git-show-history)
   )
  t)

(provide 'init-eaf)
