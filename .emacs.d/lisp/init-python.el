;; Python mode settings
(require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)


(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            (local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition))) 


(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'semantic-mode)
(add-hook 'python-mode-hook 'electric-indent-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'blacken-mode)
 
(provide 'init-python)
