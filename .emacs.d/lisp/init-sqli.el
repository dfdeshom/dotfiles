;; SQLi config

;; make SQLi use and remember command history
(defun turn-on-comint-history (history-file)
          (setq comint-input-ring-file-name history-file)
          (comint-read-input-ring 'silent))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)
            (turn-on-comint-history "/home/dfdeshom/.psql_history")))

(add-hook 'kill-buffer-hook #'comint-write-input-ring)

(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "app")
        (server :default "localhost")
        (port :default 5435)))

(provide 'init-sqli)
