;; helm mode - only useful for certain commands,
;; don't completely enable
(require 'helm)
(require 'helm-config)
(require 'helm-projectile)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
;; commented out, see below
;(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c f") 'helm-recentf)

(defun dfd/helm-do-grep-recursively (arg)
  "Make `helm-do-grep` always grep files recursively"
  (interactive "P")
  (let ((current-prefix-arg (not arg)))
    (helm-do-grep)))

(defun dfd/helm-omni (&rest arg) 
  ;; just in case someone decides to pass an argument, helm-omni won't fail.
  (interactive)
  ;; show full path in recentf buffer     
  (let ((helm-ff-transformer-show-only-basename nil))
    
    ;; populate current buffer list first if not set
  (unless helm-source-buffers-list
    (setq helm-source-buffers-list
          (helm-make-source "Buffers" 'helm-source-buffers)))
  
  (helm-other-buffer
   ;; current buffers, all recent files
    (append '( helm-source-buffers-list 
               helm-source-recentf)    

      ;; projectile 
      (if (projectile-project-p) 
        '(helm-source-projectile-files-list
           helm-source-projectile-recentf-list
           helm-source-projectile-projects)
        '())

      ;; ask to create a buffer otherwise
      '(helm-source-buffer-not-found))
    "*helm-omni*")))

;; give me more buffer to search through by default
(global-set-key (kbd "C-x b")   #'dfd/helm-omni)

;; don't wrap lines in helm buffers, they're wasting space
;; mimics ibuffer behavior
(add-hook 'helm-update-hook (lambda () (setq truncate-lines t)))

(provide 'init-helm)
        
