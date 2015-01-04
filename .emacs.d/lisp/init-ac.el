(require 'auto-complete)
(global-auto-complete-mode t)

; auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

(provide 'init-ac)
