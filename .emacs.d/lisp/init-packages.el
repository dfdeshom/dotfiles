(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
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
        org
        flycheck
        flycheck-package
        auto-complete
        find-file-in-repository
        markdown-mode
        notify
        projectile
        helm
        helm-swoop
        helm-projectile
        helm-mt
        helm-open-github
        howm
        session
        paredit
        rainbow-delimiters
        exec-path-from-shell
        yaml-mode
        sqlformat
        dockerfile-mode
	elpy
        perspective
        multi-term) "Packages to install.")
 
(mapc 'install-if-needed to-install)

(provide 'init-packages)
