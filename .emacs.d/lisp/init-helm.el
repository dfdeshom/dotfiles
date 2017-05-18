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

(defun dfd/helm-omni (&rest arg)
  "Define my own custom source list and ordering when changing/listing buffers"
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
            helm-source-projectile-projects
            helm-source-projectile-recentf-list)
        '())

      ;; files in the current directory
      '(helm-source-files-in-current-dir)
      
      ;; ask to create a buffer otherwise
      '(helm-source-buffer-not-found)
      
      )
    "*helm-omni*")))

;; give me more buffer to search through by default
(global-set-key (kbd "C-x b")   #'dfd/helm-omni)

;; don't wrap lines in helm buffers, they're wasting space
;; mimics ibuffer behavior
;; (add-hook 'helm-update-hook (lambda () (setq truncate-lines t)))

;; always show helm window to the right, never under current window 
(setq helm-split-window-default-side 'right)
(setq helm-always-two-windows t)

;; when navigating the mark ring, follow the highlited selection
;; automatically


(provide 'init-helm)
        
