(persp-mode 1)

(setq persp-state-default-file "~/.emacs.d/perspective/persist.el")

(add-hook 'after-init-hook #'(lambda () (persp-state-load persp-state-default-file)))
(add-hook 'kill-emacs-hook #'persp-state-save)

(provide 'init-perspective)
