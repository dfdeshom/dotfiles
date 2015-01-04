;; markdown mode
(require 'markdown-mode)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

(provide 'init-markdown)
