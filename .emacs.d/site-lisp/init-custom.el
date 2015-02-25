(defvar init-files
  '(dfd-ssh))

(defun load-custom-files ()
  (dolist (file init-files)
    (require file)))

(provide 'init-custom)
