;; SQLi config
(setq sql-product 'postgres)

(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "app")
        (server :default "localhost")
        (port :default 5435)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Provide completions to SQli[postgres]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'company)

(defvar dfd--postgres-completions
  '("abbrev" "abs" "acos" "age" "area" "ascii" "asin" "atab2" "atan"
"atan2" "avg" "bit_length" "both" "broadcast" "btrim" "cbrt" "ceil"
"center" "char_length" "chr" "coalesce" "col_description" "convert"
"cos" "cot" "count" "current_database" "current_date" "current_schema"
"current_schemas" "current_setting" "current_time" "current_timestamp"
"current_user" "currval" "date_part" "date_trunc" "decode" "degrees"
"diameter" "encode" "exp" "extract" "floor" "get_bit" "get_byte"
"has_database_privilege" "has_function_privilege"
"has_language_privilege" "has_schema_privilege" "has_table_privilege"
"height" "host" "initcap" "isclosed" "isfinite" "isopen" "leading"
"length" "ln" "localtime" "localtimestamp" "log" "lower" "lpad"
"ltrim" "masklen" "max" "min" "mod" "netmask" "network" "nextval"
"now" "npoints" "nullif" "obj_description" "octet_length" "overlay"
"pclose" "pg_client_encoding" "pg_function_is_visible"
"pg_get_constraintdef" "pg_get_indexdef" "pg_get_ruledef"
"pg_get_userbyid" "pg_get_viewdef" "pg_opclass_is_visible"
"pg_operator_is_visible" "pg_table_is_visible" "pg_type_is_visible"
"pi" "popen" "position" "pow" "quote_ident" "quote_literal" "radians"
"radius" "random" "repeat" "replace" "round" "rpad" "rtrim"
"session_user" "set_bit" "set_byte" "set_config" "set_masklen"
"setval" "sign" "sin" "split_part" "sqrt" "stddev" "strpos" "substr"
"substring" "sum" "tan" "timeofday" "to_ascii" "to_char" "to_date"
"to_hex" "to_number" "to_timestamp" "trailing" "translate" "trim"
"trunc" "upper" "variance" "version" "width"

"abort" "access" "add" "after" "aggregate" "alignment" "all" "alter"
"analyze" "and" "any" "as" "asc" "assignment" "authorization"
"backward" "basetype" "before" "begin" "between" "binary" "by" "cache"
"called" "cascade" "case" "cast" "characteristics" "check"
"checkpoint" "class" "close" "cluster" "column" "comment" "commit"
"committed" "commutator" "constraint" "constraints" "conversion"
"copy" "create" "createdb" "createuser" "cursor" "cycle" "database"
"deallocate" "declare" "default" "deferrable" "deferred" "definer"
"delete" "delimiter" "desc" "distinct" "do" "domain" "drop" "each"
"element" "else" "encoding" "encrypted" "end" "escape" "except"
"exclusive" "execute" "exists" "explain" "extended" "external" "false"
"fetch" "finalfunc" "for" "force" "foreign" "forward" "freeze" "from"
"full" "function" "grant" "group" "gtcmp" "handler" "hashes" "having"
"immediate" "immutable" "implicit" "in" "increment" "index" "inherits"
"initcond" "initially" "input" "insensitive" "insert" "instead"
"internallength" "intersect" "into" "invoker" "is" "isnull"
"isolation" "join" "key" "language" "leftarg" "level" "like" "limit"
"listen" "load" "local" "location" "lock" "ltcmp" "main" "match"
"maxvalue" "merges" "minvalue" "mode" "move" "natural" "negator"
"next" "nocreatedb" "nocreateuser" "none" "not" "nothing" "notify"
"notnull" "null" "of" "offset" "oids" "on" "only" "operator" "or"
"order" "output" "owner" "partial" "passedbyvalue" "password" "plain"
"prepare" "primary" "prior" "privileges" "procedural" "procedure"
"public" "read" "recheck" "references" "reindex" "relative" "rename"
"reset" "restrict" "returns" "revoke" "rightarg" "rollback" "row"
"rule" "schema" "scroll" "security" "select" "sequence" "serializable"
"session" "set" "sfunc" "share" "show" "similar" "some" "sort1"
"sort2" "stable" "start" "statement" "statistics" "storage" "strict"
"stype" "sysid" "table" "temp" "template" "temporary" "then" "to"
"transaction" "trigger" "true" "truncate" "trusted" "type"
"unencrypted" "union" "unique" "unknown" "unlisten" "until" "update"
"usage" "user" "using" "vacuum" "valid" "validator" "values"
"variable" "verbose" "view" "volatile" "when" "where" "with" "without"
"work"

"anyarray" "bigint" "bigserial" "bit" "boolean" "box" "bytea" "char"
"character" "cidr" "circle" "cstring" "date" "decimal" "double"
"float4" "float8" "inet" "int2" "int4" "int8" "integer" "internal"
"interval" "language_handler" "line" "lseg" "macaddr" "money"
"numeric" "oid" "opaque" "path" "point" "polygon" "precision" "real"
"record" "regclass" "regoper" "regoperator" "regproc" "regprocedure"
"regtype" "serial" "serial4" "serial8" "smallint" "text" "time"
"timestamp" "varchar" "varying" "void" "zone"

"ada" "asensitive" "assignment" "asymmetric" "atomic" "between"
"bitvar" "called" "catalog_name" "chain" "character_set_catalog"
"character_set_name" "character_set_schema" "checked" "class_origin"
"cobol" "collation_catalog" "collation_name" "collation_schema"
"column_name" "command_function" "command_function_code" "committed"
"condition_number" "connection_name" "constraint_catalog"
"constraint_name" "constraint_schema" "contains" "cursor_name"
"datetime_interval_code" "datetime_interval_precision" "defined"
"definer" "dispatch" "dynamic_function" "dynamic_function_code"
"existing" "exists" "final" "fortran" "generated" "granted"
"hierarchy" "hold" "implementation" "infix" "insensitive" "instance"
"instantiable" "invoker" "key_member" "key_type" "length" "m"
"message_length" "message_octet_length" "message_text" "method" "more"
"mumps" "name" "nullable" "number" "options" "overlaps" "overriding"
"parameter_mode" "parameter_name" "parameter_ordinal_position"
"parameter_specific_catalog" "parameter_specific_name"
"parameter_specific_schema" "pascal" "pli" "position" "repeatable"
"returned_length" "returned_octet_length" "returned_sqlstate"
"routine_catalog" "routine_name" "routine_schema" "row_count" "scale"
"schema_name" "security" "self" "sensitive" "serializable"
"server_name" "similar" "simple" "source" "specific_name" "style"
"subclass_origin" "sublist" "symmetric" "system" "table_name"
"transaction_active" "transactions_committed"
"transactions_rolled_back" "transform" "transforms" "trigger_catalog"
"trigger_name" "trigger_schema" "type" "uncommitted" "unnamed"
"user_defined_type_catalog" "user_defined_type_name"
"user_defined_type_schema"

"absolute" "action" "add" "admin" "after" "aggregate" "alias" "all"
"allocate" "alter" "and" "any" "are" "as" "asc" "assertion" "at"
"authorization" "before" "begin" "both" "breadth" "by" "call"
"cascade" "cascaded" "case" "catalog" "check" "class" "close"
"collate" "collation" "column" "commit" "completion" "connect"
"connection" "constraint" "constraints" "constructor" "continue"
"corresponding" "create" "cross" "cube" "current" "cursor" "cycle"
"data" "day" "deallocate" "declare" "default" "deferrable" "deferred"
"delete" "depth" "deref" "desc" "describe" "descriptor" "destroy"
"destructor" "deterministic" "diagnostics" "dictionary" "disconnect"
"distinct" "domain" "drop" "dynamic" "each" "else" "end" "equals"
"escape" "every" "except" "exception" "exec" "execute" "external"
"false" "fetch" "first" "for" "foreign" "found" "free" "from" "full"
"function" "general" "get" "global" "go" "goto" "grant" "group"
"grouping" "having" "host" "hour" "identity" "ignore" "immediate" "in"
"indicator" "initialize" "initially" "inner" "inout" "input" "insert"
"intersect" "into" "is" "isolation" "iterate" "join" "key" "language"
"last" "lateral" "leading" "left" "less" "level" "like" "limit"
"local" "locator" "map" "match" "minute" "modifies" "modify" "module"
"month" "names" "natural" "new" "next" "no" "none" "not" "null" "of"
"off" "old" "on" "only" "open" "operation" "option" "or" "order"
"ordinality" "out" "outer" "output" "pad" "parameter" "parameters"
"partial" "path" "postfix" "prefix" "preorder" "prepare" "preserve"
"primary" "prior" "privileges" "procedure" "public" "read" "reads"
"recursive" "references" "referencing" "relative" "restrict" "result"
"return" "returns" "revoke" "right" "role" "rollback" "rollup"
"routine" "rows" "savepoint" "schema" "scroll" "search" "second"
"section" "select" "sequence" "session" "set" "sets" "size" "some"
"space" "specific" "specifictype" "sql" "sqlexception" "sqlstate"
"sqlwarning" "start" "state" "statement" "static" "structure" "table"
"temporary" "terminate" "than" "then" "timezone_hour"
"timezone_minute" "to" "trailing" "transaction" "translation"
"trigger" "true" "under" "union" "unique" "unknown" "unnest" "update"
"usage" "using" "value" "values" "variable" "view" "when" "whenever"
"where" "with" "without" "work" "write" "year"

"abs" "avg" "bit_length" "cardinality" "cast" "char_length"
"character_length" "coalesce" "convert" "count" "current_date"
"current_path" "current_role" "current_time" "current_timestamp"
"current_user" "extract" "localtime" "localtimestamp" "lower" "max"
"min" "mod" "nullif" "octet_length" "overlay" "placing" "session_user"
"substring" "sum" "system_user" "translate" "treat" "trim" "upper"
"user"

"array" "binary" "bit" "blob" "boolean" "char" "character" "clob"
"date" "dec" "decimal" "double" "float" "int" "integer" "interval"
"large" "national" "nchar" "nclob" "numeric" "object" "precision"
"real" "ref" "row" "scope" "smallint" "time" "timestamp" "varchar"
"varying" "zone"

))

(defun dfd/table-name-completions ()
  "Get table names from the currect database as completion candidates."
  (defvar dfd--pguser (nth 2 (nth 0 sql-postgres-login-params)))
  (defvar dfd--pgdb (nth 2 (nth 1 sql-postgres-login-params)))
  (defvar dfd--pghost (nth 2 (nth 2 sql-postgres-login-params)))
  (defvar dfd--pgport (nth 2 (nth 3 sql-postgres-login-params)))

  (defvar dfd--pcmd (format "%s -U %s -h %s -p %s -P pager=off -t %s -c \"%s\" "
                            sql-postgres-program
                            dfd--pguser
                            dfd--pghost
                            dfd--pgport
                            dfd--pgdb
                            "SELECT table_name FROM information_schema.tables WHERE table_schema='public';"
                            ))
  (split-string (shell-command-to-string dfd--pcmd) "\n "))

(defun dfd/build-postgres-completions ()
  "Build the complete set of sql-postgress completions"
  (setq dfd--postgres-completions (append dfd--postgres-completions (dfd/table-name-completions)))
  (setq dfd--postgres-completions (delete-dups dfd--postgres-completions))
)

(defun dfd/company-postgres-backend (command &optional arg &rest ignored)
  "Provide a completion backend to postgres commands for use with SQLi.
As per company-mode conventions, COMMAND is a action that the backend
should respond to, ARG and IGNORED are not used."
  (interactive (list 'interactive))

  (case command
    (interactive (company-begin-backend (dfd/build-postgres-completions)))
    (prefix (and (eq major-mode 'sql-interactive-mode)
                (company-grab-symbol)))
    (candidates
    (remove-if-not
      (lambda (c) (string-prefix-p arg c))
      (dfd/build-postgres-completions)))))

;; add the backend
(add-to-list 'company-backends 'dfd/company-postgres-backend)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make SQLi use and remember command history
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun turn-on-comint-history (history-file)
          (setq comint-input-ring-file-name history-file)
          (comint-read-input-ring 'silent))

(add-hook 'kill-buffer-hook #'comint-write-input-ring)

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)
            (company-mode)
            ;; save history for postgres
            (if  (eq sql-product 'postgres)
                (turn-on-comint-history "/home/dfdeshom/.psql_history"))
            ;; save history for custom tsql
            (if  (eq sql-product 'ms-tsql)
                (turn-on-comint-history "/home/dfdeshom/.tsql_history"))
            
            )
            )

(provide 'init-sqli)
