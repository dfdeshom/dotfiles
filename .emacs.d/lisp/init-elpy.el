;; elpy
(require 'elpy)

(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-timeout 10)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'init-elpy)
