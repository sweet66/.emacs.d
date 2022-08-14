(require 'magit)
(require 'magit-extension)

;; Magit configuration.
(setq magit-commit-ask-to-stage nil)    ;don't ask stage question
(setq magit-display-buffer-noselect t)  ;don't select magit buffer default

;; Make path column have enough space to display.
(setq magit-submodule-list-columns
      '(("Path"     80 magit-modulelist-column-path   nil)
        ("Version"  30 magit-repolist-column-version  nil)
        ("Branch"   20 magit-repolist-column-branch   nil)
        ("B<U" 3 magit-repolist-column-unpulled-from-upstream   ((:right-align t)))
        ("B>U" 3 magit-repolist-column-unpushed-to-upstream     ((:right-align t)))
        ("B<P" 3 magit-repolist-column-unpulled-from-pushremote ((:right-align t)))
        ("B>P" 3 magit-repolist-column-unpushed-to-pushremote   ((:right-align t)))
        ("B"   3 magit-repolist-column-branches                 ((:right-align t)))
        ("S"   3 magit-repolist-column-stashes                  ((:right-align t)))))

;; Make `magit-blame' always with sidebar style.
(setq magit-blame--style
      '(margin
        (margin-format " %s%f" " %C %a" " %H")
        (margin-width . 42)
        (margin-face . magit-blame-margin)
        (margin-body-face magit-blame-dimmed)))

(defvar one-key-menu-magit-alist nil
  "The `one-key' menu alist for MAGIT.")

(setq one-key-menu-magit-alist
      '(
        (("s" . "Magit status") . magit-status+)
        (("c" . "Magit commit") . magit-commit)
        (("u" . "Magit push") . magit-push-current-to-upstream)
        (("i" . "Magit pull") . magit-pull-from-upstream)
        (("l" . "Magit log") . magit-log-all)
        (("b" . "Magit blame") . magit-blame)
        (("B" . "Magit buffer") . magit-process-buffer)
        (("m" . "Magit submodule add") . magit-submodule-add+)
        (("d" . "Magit submodule remove") . magit-submodule-remove)
        (("M" . "Magit submodule list") . magit-list-submodules)
        (("D" . "Magit discarded") . magit-discard)
        (("," . "Magit init") . magit-init)
        (("." . "Magit add remote") . magit-remote-add)
        (("h" . "Magithub menu") . one-key-menu-magithub)
        ))

(defun one-key-menu-magit ()
  "The `one-key' menu for MAGIT."
  (interactive)
  (one-key-menu "MAGIT" one-key-menu-magit-alist t))

(defvar one-key-menu-magithub-alist nil
  "The `one-key' menu alist for MAGITHUB.")

(setq one-key-menu-magithub-alist
      '(
        (("h" . "Browse") . magithub-browse)
        (("i" . "Create issue") . magithub-issue-new)
        (("b" . "Browse issue") . magithub-issue-browse)
        (("B" . "Browse pull") . magithub-pull-browse)
        ))

(defun one-key-menu-magithub ()
  "The `one-key' menu for MAGITHUB."
  (interactive)
  (require 'magithub)
  (one-key-menu "MAGITHUB" one-key-menu-magithub-alist t))

(defun magit-submodule-add+ (url)
  (interactive "sURL: ")
  (magit-submodule-add
   url
   (concat (file-name-as-directory sweet-emacs-extension-dir) (file-name-base url))
   (file-name-base url)))

(defun magit-status+ ()
  (interactive)
  (magit-status)
  (other-window 1))

(provide 'init-git)
