(let* ((lisp-dir (expand-file-name "lisp" user-emacs-directory))
       (vendor-dir (expand-file-name "vendor" user-emacs-directory)))
  (add-to-list 'load-path lisp-dir))

(defvar init-files
  '(init-packages
    init-jedi
    init-flymake
    init-ac
    init-venv
    init-autopep8
    init-defaults
    init-magit
    init-markdown
    init-helm
    init-helm-swoop
    init-pigmode
    init-recentf
    init-smex
    init-python
))

(defun load-init-files ()
  (dolist (file init-files)
    (require file)))

(provide 'init-bootstrap)
