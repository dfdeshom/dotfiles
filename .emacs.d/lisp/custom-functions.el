(require 'cl)
(require 'helm-buffers)
 
;; internal functions
(defun dfdeshom/terminal-buffers ()
  "Filter for buffers that are terminals only"
  (cl-loop for buf in (buffer-list)
           if (eq 'term-mode (buffer-local-value 'major-mode buf))
           collect (buffer-name buf)) )

(defun dfdeshom/launch-term (name)
  "Create new terminal in a buffer called NAME"
  (multi-term)
  (rename-buffer (format "*%s*" name))) 

(defun dfdeshom/delete-marked-terms (_ignore)
  "Delete marked terminals "
  (let* ((buffers (helm-marked-candidates :with-wildcard t))
         (len (length buffers)))
    (with-helm-display-marked-candidates
      helm-marked-buffer-name
      (if (not (y-or-n-p (format "Delete %s Terminal(s)?" len)))
          (message "(No deletions performed)")
        (cl-dolist (b buffers)
          ;; kill the process in the buffer
          ;; then delete buffer, to avoid confirmation questions
          (delete-process b)
          (kill-buffer b))
        (message "%s Terminals deleted" len)))))

;; sources
(setq dfdeshom/term-source-terminals
      (helm-build-sync-source "terminal buffers"
        :candidates (lambda () (dfdeshom/terminal-buffers))
        :fuzzy-match helm-buffers-fuzzy-matching
        :keymap helm-buffers-ido-virtual-map
        :action (helm-make-actions
                 "Switch to terminal buffer"
                 (lambda (candidate)
                   (helm-switch-to-buffer candidate))
        
        "Exit marked terminals"  'dfdeshom/delete-marked-terms)))
 
(setq dfdeshom/term-source-terminal-not-found
  (helm-build-dummy-source
   "Launch new terminal"
   :action (helm-make-actions
            "Launch new terminal"
            (lambda (candidate) (dfdeshom/launch-term candidate)))))


(setq dfdeshom/term-source-term-list 
      '( dfdeshom/term-source-terminals
         dfdeshom/term-source-terminal-not-found))
 
;; main helm function
(defun dfdeshom/helm-terms ()
  "Custom helm buffer for terminals only"
  (interactive)
   (helm-other-buffer  
    dfdeshom/term-source-term-list "*helm terminal buffers*"))
  
(global-set-key (kbd "C-x t")  'dfdeshom/helm-terms)

(provide 'custom-functions)
