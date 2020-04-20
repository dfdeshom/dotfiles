;;exec-path-from-shell

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "WORKON_HOME")

(provide 'init-exec-path-from-shell)
