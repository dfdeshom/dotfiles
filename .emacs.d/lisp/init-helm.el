;; helm mode - only useful for certain commands,
;; don't completely enable
(require 'helm)
(require 'helm-config)

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
  (helm-other-buffer
    (append '(helm-source-buffers-list ;; list of all open buffers
               helm-source-recentf)    ;; all recent files

      ;; projectile 
      (if (projectile-project-p) 
        '(helm-source-projectile-files-list
           helm-source-projectile-recentf-list
           helm-source-projectile-projects)
        '())

      '(
         helm-source-buffer-not-found     ;; ask to create a buffer otherwise
         ))
    "*helm-omni*"))

;; give me more buffer to search through by default
(global-set-key (kbd "C-x b")   #'dfd/helm-omni)

;; don't wrap lines in helm buffers, they're wasting space
;; mimics ibuffer behavior
(add-hook 'helm-update-hook (lambda () (setq truncate-lines t)))

(provide 'init-helm)
        
