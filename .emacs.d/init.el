;; give 100 MB to garbae collector
(setq gc-cons-threshold 100000000)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(require 'init-bootstrap)
(load-init-files)

(require 'init-custom)
(load-custom-files)

;; load custom theme
(load-theme 'wombat)

 (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open")))) 
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "dark slate gray"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "dark cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "maroon")))))

