;; helm mode - only useful for certain commands,
;; don't completely enable
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c f") 'helm-recentf)

(defun helm-do-grep-recursively (arg)
  "Make `helm-do-grep` always grep files recursively"
  (interactive "P")
  (let ((current-prefix-arg (not arg)))
    (helm-do-grep)))

;; don't wrap lines in helm buffers, they're wasting space
;; mimics ibuffer behavior
(add-hook 'helm-update-hook (lambda () (setq truncate-lines t)))

(provide 'init-helm)
        
