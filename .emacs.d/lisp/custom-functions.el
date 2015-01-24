(require 'cl)

(defun dfdeshom/terminal-buffers ()
  "Filter for buffers that are terminals only"
  (cl-loop for buf in (buffer-list)
                            if (eq 'term-mode (buffer-mode buf))
                            collect (buffer-name buf)) )

(setq dfdeshom/helm-source-terminals
  (helm-build-sync-source "terminal buffers"
    :candidates (lambda () (dfdeshom/terminal-buffers))
    :fuzzy-match helm-buffers-fuzzy-matching
    :keymap helm-buffers-ido-virtual-map
    :mode-line helm-buffers-ido-virtual-mode-line-string        
    :action (helm-make-actions
            "Switch to terminal buffer"
            (lambda (candidate)
              (helm-switch-to-buffer candidate)))))

(defun dfdeshom/helm-terms ()
  "Custom helm buffer for terminals only"
  (interactive)
  (helm-other-buffer '(dfdeshom/helm-source-terminals)
                     "*helm terminal buffers*"))

(global-set-key (kbd "C-x t")  'dfdeshom/helm-terms)

(provide 'custom-functions)
