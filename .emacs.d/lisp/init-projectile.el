(require 'projectile)
(require 'helm-projectile)

;(projectile-global-mode)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching nil)

(setq projectile-switch-project-action 'helm-projectile)

(add-to-list 'projectile-globally-ignored-directories ".git")

(global-set-key [f7] 'helm-projectile-find-file)

(provide 'init-projectile)
