(require 'flymake)

;; Don't save files in-place
(setq flymake-run-in-place nil)

;; This lets me say where my temp dir is.

(setq temporary-file-directory "~/.emacs.d/tmp/")

(provide 'init-flymake)

