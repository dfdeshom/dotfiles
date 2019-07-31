(require 'magit) 
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key "\C-xg" 'magit-status)

(setq git-commit-summary-max-length 1000)
;; don't let session save cursor position in git commit
;; buffers
(eval-after-load 'session
  '(add-to-list 'session-mode-disable-list 'git-commit-mode))

;; enabling `compilation-minor-mode` so that
;; when errors show up due to failures in commit hooks
;; that were ran, AND the output is of the form
;; `path/to/file.go:21:20:`
;; we can go to the exact file at the exact line number
(add-hook 'magit-mode-hook (lambda ()
                             (when (eq major-mode 'magit-process-mode)
                               (compilation-minor-mode)
                               )
                             ))

(provide 'init-magit)
