;;; package -- Summary
;;; Commentary:
;;; easier ssh-ingo into work machines

(require 'helm)
(require 'multi-term)

;;; Code:
(defvar ssh-config-path)
(setq ssh-config-path "~/.ssh/known_hosts")

(defun extract-host (line)
  "Extract host from a known_host file.  LINE is a line in this file."
  (if (string-match "," line)
      (list (car (split-string line  "," t)))
    ;;else
    (list (car (split-string line  " " t)))))

(defun get-current-ssh-hosts (known_hosts_file)
  "Get a list of current ssh hosts from KNOWN_HOSTS_FILE."
  (with-temp-buffer
    (insert-file-contents known_hosts_file)
    (let* ((lines (split-string (buffer-string) "\n" t))
           (names '() ))
      (dolist (line lines names)
        (setq names (append names (extract-host line)))))))

(defun dfd/ssh-shell (host)
  "Launch an SSH shell session to HOST."
  (message host)
  (let (( bufname (format "*ssh-%s*" (car (split-string host  "\\." t)))))
    (save-window-excursion
      
      ;(async-shell-command (concat "ssh " host) bufname ))
      (multi-term)
      (rename-buffer bufname)
      (send-string (get-buffer bufname) (concat "ssh " host "")))
    (switch-to-buffer bufname)))


(defun dfd/ssh-work ()
  "Log into to various machines."
  (interactive)
  (helm :sources   (list '((name . "SSH to host")
                           (candidates . (lambda () (get-current-ssh-hosts ssh-config-path)))
                           (action . (("Log into host" . (lambda (candidate)
                                                           (dfd/ssh-shell candidate))))))

                         '((name . "SSH to *new* host")
                           (dummy)
                           (action . (("Log into *new* host" . (lambda (candidate)
                                                     (dfd/ssh-shell candidate)))))))
                         
        :buffer "*ssh to work*"))

(provide 'dfd-ssh)

;;; dfd-ssh.el ends here
