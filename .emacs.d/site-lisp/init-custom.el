(defvar custom-files
  '(dfd-ssh))

(defun load-custom-files ()
  (dolist (file custom-files)
    (print file)
    (require file)))

(provide 'init-custom)
