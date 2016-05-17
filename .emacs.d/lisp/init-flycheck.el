;; add flycheck-mode, but only for writing
;; and editing elisp

(require 'flycheck)
(setq flycheck-python-flake8-executable "junk")
(setq flycheck-python-pylint-executable "/home/dfdeshom/.local/bin/pylint")

(setq flycheck-emacs-lisp-load-path 'inherit)

(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; for writing emacs packages code
;(eval-after-load 'flycheck
;      '(flycheck-package-setup))

(provide 'init-flycheck)

