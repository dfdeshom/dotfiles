;;virtualenwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/home/dfdeshom/code/parsely/venvs")
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

(provide 'init-venv)
