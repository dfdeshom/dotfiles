;; elpy
(require 'elpy)

(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-timeout 10)

(provide 'init-elpy)
