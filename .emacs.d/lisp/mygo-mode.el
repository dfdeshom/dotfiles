(add-to-list 'load-path "~/code/go/src/github.com/dougm/goflymake")
(require 'go-flymake) 
; Use goimports instead of go-fmt for formatting with intelligent package addition/removal
(setq gofmt-command "goimports")
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)
                          (auto-complete-mode -1)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (go-eldoc-setup)
                          
                          ; call Gofmt before saving
                          (add-hook 'before-save-hook 'gofmt-before-save)))


;; add GOPATH to current emacs instance via the `exec-path-from-shell` package
(exec-path-from-shell-copy-env "GOPATH")

(provide 'mygo-mode)
