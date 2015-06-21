;;; package --- Summary
;;; Commentary:
;;; 1. Load all the packages using Cask
;;; 2. Configure emacs using the emacs.org file

(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")

;;; Code:
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

;; Configure emacs in the org file
(org-babel-load-file "~/.emacs.d/emacs.org")

;;; init.el ends here
