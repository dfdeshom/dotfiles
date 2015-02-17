(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(setq multi-term-switch-after-close nil)

;;set maximum buffer size (scrollback)
(setq term-buffer-maxihvmum-size 0)

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(defun term-send-yank ()
  "Yank in term mode."
  (interactive)
  (yank)
  (term-send-raw-string (current-kill 0)))

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-k") 'term-send-yank)))

(provide 'init-multi-term)
