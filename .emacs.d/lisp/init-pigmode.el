;; pig mode settings
(require 'pig-mode)
(setq pig-executable "/user/bin/pig")
(setq pig-executable-options '("-x" "local"))
(setq pig-executable-prompt-regexp "^grunt> ")
(setq pig-indent-level 4)
(setq pig-version "0.11.0")

(provide 'init-pigmode)
