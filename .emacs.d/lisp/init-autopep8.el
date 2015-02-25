 ;; auto pep8 for nazis
(require 'py-autopep8)
(setq  py-autopep8-options  '("--ignore-error E301" "--max-line-length=100" ))
(provide 'init-autopep8)
