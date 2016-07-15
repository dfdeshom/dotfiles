(require 'magit) 
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key "\C-xg" 'magit-status)

(setq git-commit-summary-max-length 1000)
;; don't let session save cursor position in git commit
;; buffers
(eval-after-load 'session
  '(add-to-list 'session-mode-disable-list 'git-commit-mode))


(provide 'init-magit)
