(require 'projectile)
(require 'helm-projectile)

(projectile-global-mode)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-indexing-method 'native)

(setq projectile-switch-project-action 'helm-projectile)

(add-to-list 'projectile-globally-ignored-directories ".git")

(provide 'init-projectile)
