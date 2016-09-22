;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)


(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            (local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition))) 


(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'semantic-mode)
(add-hook 'python-mode-hook 'electric-indent-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)

;; ugh, see https://github.com/paetzke/py-autopep8.el/issues/19
(defun my-save-kill-ring (fun &rest _args)
  (let ((kill-ring nil))
    (funcall fun)))
(advice-add 'py-autopep8-buffer :around 'my-save-kill-ring)
(provide 'init-python)
