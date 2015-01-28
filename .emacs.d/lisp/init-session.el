(require 'session)
;; save helm M-x command history accross restarts
(add-hook 'after-init-hook 'session-initialize)

;; avoid "void-variable \.\.\." errors 
(setq session-save-print-spec '(t nil 40000))

(provide 'init-session)
