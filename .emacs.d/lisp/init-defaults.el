(ido-mode t)

(show-paren-mode t)

;; show line numbers
(global-linum-mode 0)
(linum-mode 1)
(setq linum-format "%d ")
(set-face-attribute 'linum nil :foreground "#3a777e" )
(add-hook 'prog-mode-hook 'linum-mode)

;; disable eldoc, it interferes with python-mode
(global-eldoc-mode -1)

;; highlight current line
;;(global-hl-line-mode t)

;; enable mode for rectangle editing
;(cua-selection-mode t)

(setq transient-mark-mode t)
(global-set-key "\M-g" 'goto-line)

`;; get rid of icons in graphical mode
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; just kill this buffer
(global-set-key (kbd "C-x k")  'kill-this-buffer)

;; return to original line when scrolling
(setq scroll-preserve-screen-position t)

;; use windowmove to move easily between windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;(global-set-key [f7] 'find-file-in-repository)

;; do not make backup files
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)

;; Save and restore open buffers, 
;; point, mark, histories, other variables
(desktop-save-mode 1)
(setq desktop-files-not-to-save   "^/ssh" ; don't save tramp files
      desktop-buffers-not-to-save "COMMIT_EDITMSG$" ; don't save magit buffers
       desktop-save 'ask-if-new) 

(defun dfdeshom/desktop-save ()
  "Save desktop periodically when emacs is idle"
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
 
(add-hook 'auto-save-hook 'dfdeshom/desktop-save)

;; paste from clipboard
(global-set-key (kbd "<mouse-2>") 'x-clipboard-yank)

;; paste with middle click
(setq x-select-enable-primary t)

;; prevent a bug where emacs hangs when pasting from
;; a browser
(setq x-selection-timeout 300)

;; use nice font
(set-frame-font "Monospace-13")
;(set-frame-font "Bitstream Vera Sans Mono-15")
;(set-frame-font "Fantasque Sans Mono-17")

;(set-frame-font "Ubuntu Mono-17")

;;use convenient keys for i-search
;; i-search history. Return to exit
(define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

;;i-search matches. Return to exit
(define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

(provide 'init-defaults)
