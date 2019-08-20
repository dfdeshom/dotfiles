(require 'sqlformat)                                        
(setq sqlformat-command 'pgformatter)
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)
(provide 'init-sqlformat)
