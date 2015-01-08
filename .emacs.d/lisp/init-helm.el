;; helm mode - only useful for certain commands,
;; don't completely enable
(require 'helm)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c f") 'helm-recentf)


(require 'helm-config)
(provide 'init-helm)
        
