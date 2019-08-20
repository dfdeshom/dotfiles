(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(package-initialize)
 
(unless package-archive-contents
  (package-refresh-contents))

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

(defvar to-install
      '(python-mode
        magit
        blacken
        jedi
        org
        flymake
        flycheck
        flycheck-package
        auto-complete
        find-file-in-repository
        pig-mode
        markdown-mode
        clojure-mode
        virtualenvwrapper
        notify
        projectile
        helm
        helm-swoop
        helm-projectile
        helm-mt
        helm-open-github
        session
        paredit
        rainbow-delimiters
        exec-path-from-shell
        flymake-go
        company
        company-go
        golint
        go-mode
        go-eldoc
        yaml-mode
        sqlformat
        multi-term) "Packages to install.")
 
(mapc 'install-if-needed to-install)

(provide 'init-packages)
