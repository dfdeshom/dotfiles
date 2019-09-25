(let* ((lisp-dir (expand-file-name "lisp" user-emacs-directory))
       (vendor-dir (expand-file-name "vendor" user-emacs-directory)))
  (add-to-list 'load-path lisp-dir))

(defvar init-files
  '(init-packages
    init-company
    init-jedi
    init-flycheck
    init-ac
    init-venv
    init-autopep8
    init-defaults
    init-session
    init-magit
    init-multi-term
    init-markdown
    init-helm
    init-helm-swoop
    init-projectile
    init-helm-mt
    init-pigmode
    init-recentf
    init-python
    init-orgmode
    init-paredit
    init-rainbow-delimiters
    init-blacken
    mygo-mode
    init-sqlformat
    ;init-tsql
    init-sqli
    custom-functions
))

(defun load-init-files ()
  (dolist (file init-files)
    (require file)))

(provide 'init-bootstrap)
