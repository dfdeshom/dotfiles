;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SQLi prompt for interacting with MSSQL via FreeTS's tsql
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'sql)

(defcustom sql-tsql-program "tsql"
  "Command to start tsql."
  :type 'file
  :group 'SQL)

(defcustom sql-tsql-options '("")
      "List of additional options for `sql-tsql-program'."
      :type '(repeat string)
      :group 'SQL)

(defcustom sql-tsql-login-params '(user password server database)
  "List of login parameters needed to connect to Microsoft via TSQL."
  :type 'sql-login-params
  :group 'SQL)

(defun sql-comint-tsql (product options &optional buf-name)
  "Create comint buffer and connect to Microsoft SQL Server via tsql."
  ;; Put all parameters to the program (if defined) in a list and call
  ;; make-comint.
  (let ((params
         (append
          (if (not (string= "" sql-user))
              (list "-U" sql-user))
          (if (not (string= "" sql-database))
              (list "-D" sql-database))
          (if (not (string= "" sql-server))
              (list "-S" sql-server))
          options)))
    (setq params
          (if (not (string= "" sql-password))
              `("-P" ,sql-password ,@params)
            (if (string= "" sql-user)
                ;; If neither user nor password is provided, use system
                ;; credentials.
                `("-E" ,@params)
              ;; If -P is passed to ISQL as the last argument without a
              ;; password, it's considered null.
              `(,@params "-P"))))
    ;;(message params )
    (sql-comint product params buf-name)))


(defun sql-tsql (&optional buffer)
  "Run tsql by FreeTDS as an inferior process.
If buffer `*SQL*' exists but no process is running, make a new process.
"
  (interactive "P")
  (sql-product-interactive 'ms-tsql buffer))

(sql-add-product 'ms-tsql
                   "MSQLS via tsql"
                   :free-software t
                   :font-lock sql-mode-ms-font-lock-keywords
                   :sqli-program sql-tsql-program
                   :sqli-options sql-tsql-options
                   :sqli-login sql-tsql-login-params
                   :sqli-comint-func 'sql-comint-tsql
                   :prompt-regexp "^[0-9]*> "
                   :prompt-cont-regexp "^[0-9]*> "
                   :prompt-length 5
                   :syntax-alist '((?@ . "_"))
                   :terminator '("^go" . "go")
                 )

(provide 'init-tsql)
