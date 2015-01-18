;(require 'cask "~/.cask/cask.el")
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)

(when (not (cl-remove-if-not 
	    (lambda (p) (equal 'org (car p)))
	    package-alist))
  (message "No org-mode package found; installing now...")
  (package-install 'org))

(require 'org)
(when (string-match "^[1234567]" (org-version))
  (warn "Org-Mode is out of date. We expect org 8 or higher, but instead we have %s" (org-version)))

(require 'pallet)

(org-babel-load-file "~/.emacs.d/emacs.org")

(load-theme 'zenburn)

(add-hook 'after-init-hook #'global-flycheck-mode)


