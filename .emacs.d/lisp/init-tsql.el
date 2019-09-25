;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SQLi prompt for interacting with MSSQL via FreeTS's tsql
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'sql)

;; (defcustom sql-tsql-program  "tsql binary"
;;   "Command to start tsql."
;;   :type 'file
;;   :group 'SQL)

;; (setq sql-tsql-program (car (mfc:-env-server-command)))

;; ;(message sql-tsql-program)
;; ;(setq sql-tsql-program "/home/dfdeshom/.emacs.d/.python-environments/default/bin/console.py")

;; (message sql-tsql-program)

;; (defcustom sql-tsql-options nil
;;       "List of additional options for `sql-tsql-program'."
;;       :type '(repeat string)
;;       :group 'SQL)

;; (defcustom sql-tsql-login-params '(user password server database)
;;   "List of login parameters needed to connect to Microsoft via TSQL."
;;   :type 'sql-login-params
;;   :group 'SQL)

;; (defun sql-comint-tsql (product options &optional buf-name)
;;   "Create comint buffer and connect to Microsoft SQL Server via tsql."
;;   ;; Put all parameters to the program (if defined) in a list and call
;;   ;; make-comint.
;;   (let ((params
;;          (append
;;           (if (not (string= "" sql-user))
;;               (list "-U" (format "%s" sql-user)))
;;           (if (not (string= "" sql-database))
;;               (list "-D" sql-database))
;;           (if (not (string= "" sql-server))
;;               (list "-S" sql-server))
;;           options)))
;;     (setq params
;;           (if (not (string= "" sql-password))
;;               `("-P" ,sql-password ,@params)
;;             (if (string= "" sql-user)
;;                 ;; If neither user nor password is provided, use system
;;                 ;; credentials.
;;                 `("-E" ,@params)
;;               ;; If -P is passed to ISQL as the last argument without a
;;               ;; password, it's considered null.
;;               `(,@params "-P"))))

;;     (sql-comint product params buf-name)))


;; (defun sql-tsql-test (&optional buffer)
;;   "Run tsql by FreeTDS as an inferior process.
;; If buffer `*SQL*' exists but no process is running, make a new process.
;; "
;;   (interactive "P")
;;   (sql-product-interactive 'ms-tsql115 buffer))

;; (sql-add-product 'ms-tsql115
;;                    "MSQLS via tsql"
;;                    :font-lock sql-mode-ms-font-lock-keywords
;;                    :sqli-program sql-tsql-program
;;                    :sqli-options sql-tsql-options
;;                    :sqli-login sql-tsql-login-params
;;                    :sqli-comint-func 'sql-comint-tsql
;;                    :prompt-regexp "^msql> "
;;                    :prompt-cont-regexp "^msql> "
;;                    :prompt-length 6
;;                    ;:syntax-alist '((?@ . "_"))
;;                    ;:terminator '("^go" . "go")
;;                  )

;; (setq sql-tsql-login-params
;;       '((user :default "trustaff\\rbandit1")
;;         (database :default "Trustaff_Med")
;;         (server :default "192.168.0.9")
;;         (password :default "^R3stl3ss47^")
;;         ))

(provide 'init-tsql)
 
;(sql-comint 'ms-tsql114 '("-P" "^R3stl3ss47^" "-U" "trustaff\\rbandit1"  "-D" "Trustaff_Med" "-S" "192.168.0.9" "") "*SQL*")

