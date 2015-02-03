(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)
 
(unless package-archive-contents
  (package-refresh-contents))

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

(defvar to-install
      '(python-mode 
        magit  
        jedi
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
        py-autopep8
        projectile
        helm 
        helm-swoop
        helm-projectile
        helm-mt
        session
        multi-term) "Packages to install")
 
(mapc 'install-if-needed to-install)

(provide 'init-packages)
