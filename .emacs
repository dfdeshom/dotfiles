;; Python IDE settings

;; Requisites: Emacs >= 24
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
 
;;(package-refresh-contents)

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

;; (defun install-if-needed (package)
;;     (package-install package))

;; make more packages available with the package installer
(setq to-install
      '(python-mode magit yasnippet jedi auto-complete  find-file-in-repository pig-mode markdown-mode clojure-mode virtualenvwrapper smex notify browse-kill-ring py-autopep8  helm))
 
(mapc 'install-if-needed to-install)
   
(require 'magit) 
(global-set-key "\C-xg" 'magit-status)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'flymake)
(require 'yasnippet)

(global-set-key [f7] 'find-file-in-repository)

; auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

;; ;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; Jedi settings
(require 'jedi)

(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            (local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition))) 

(setq jedi:complete-on-dot t)

;Flymake settings for Python
(setq flymake-run-in-place nil)
(setq temporary-file-directory "/tmp/")

(defun flymake-activate ()
  "Activates flymake when real buffer and you have write access"
  (if (and
       (buffer-file-name)
       (file-writable-p buffer-file-name))
      (progn
        (flymake-mode t)
        ;; this is necessary since there is no flymake-mode-hook...
        (local-set-key (kbd "C-c n") 'flymake-goto-next-error)
        (local-set-key (kbd "C-c p") 'flymake-goto-prev-error))))


(when (load "flymake" t)
    (defun flymake-pylint-init ()
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "~/.local/bin/epylint" (list local-file))))
    
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.py\\'" flymake-pylint-init)))

(defun ca-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
 

;; auto pep8 for nazis
(defun pep8ize ()
  "pep8"
  (add-hook 'before-save-hook 'py-autopep8-before-save nil t)
)

;(add-hook 'python-mode-hook 'flymake-activate)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'pep8ize)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'post-command-hook 'ca-flymake-show-help)

(setq py-autopep8-options '("--max-line-length=100"))

;;virtualenwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/home/dfdeshom/code/cogtree/venvs")
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

;;ido mode
(ido-mode t)

;; -------------------- extra nice things --------------------
(show-paren-mode t)

;; auto-indent with return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; show line numbers
(global-linum-mode 0)
(setq linum-format "%d ")
(set-face-attribute 'linum nil :foreground "#BDBCBC" )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; end Python IDE settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; floobits
;;(load "~/.emacs.d/floobits/floobits.el")

;; load custom theme
(load-theme 'wombat)

(setq transient-mark-mode t)
(global-set-key "\M-g" 'goto-line)

;; iswitchb
(iswitchb-mode 0)

;; get rid of icons in graphical mode
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; markdown mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

;; pig mode settings
(setq pig-executable "/user/bin/pig")
(setq pig-executable-options '("-x" "local"))
(setq pig-executable-prompt-regexp "^grunt> ")
(setq pig-indent-level 4)
(setq pig-version "0.11.0")

;; do not make backup files
(setq make-backup-files nil)

;;smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;; (defun recentf-ido-find-file ()
;;   "Find a recent file using ido."
;;   (interactive)
;;   (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
;;     (when file
;;       (find-file file))))

;; (global-set-key (kbd "C-c f") 'recentf-ido-find-file)

(global-set-key (kbd "C-c f") 'helm-recentf)

(setq-default indent-tabs-mode nil)

;; yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; return to original line when scrolling
(setq scroll-preserve-screen-position t)

;; helm mode - only useful for certain commands,
;; don't completely enable
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)

(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
;(global-set-key (kbd "C-x C-f") #'helm-find-files)
;(global-set-key (kbd "C-x C-r") #'helm-recentf)

;(helm-mode t)
;;(helm-adaptative-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 )
