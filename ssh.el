(require 'cl)

(setq ssh-config-path "~/.ssh/known_hosts")

(defun extract-host (line)
  "Extract host from a known_host file. LINE is a 
line in this file"
  (if (string-match "," line)
      (list (car (split-string line  "," t)))
    ;;else
    (list (car (split-string line  " " t)))))

(defun get-current-ssh-hosts (filePath)
  "Get a list of current ssh "
  (with-temp-buffer
    (insert-file-contents filePath)
    (let* ((lines (split-string (buffer-string) "\n" t))
           (names '() ))
      ;(message (car lines))
      (dolist (line lines names)
        ;; if , in line, use as separator,
        ;; else, use " "
        (setq names (append names
                            (extract-host line)
                            )) 
        
        )

      )
   
    ))


;; (defun get-remote-names ()
;;   (interactive)
;;   (let ((ssh-config (get-file-as-string ssh-config-path) )
;;         (ssh-host-names))
;;     (while ssh-config
;;       (let ((line (car ssh-config)))
;;         (if (and (string-match-p "Host " line)
;;                  (not (string-match-p "*" line))
;;                  (not (string-match-p "^# " line)))
;;             (setq ssh-host-names (cons (cadr (split-string line " "))
;;                                        ssh-host-names))))
;;       (setq ssh-config (cdr ssh-config)))
;;     ssh-host-names))
