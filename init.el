;;; package --- Summary
;;; Commentary:
;;; 1. Load all the packages using Cask
;;; 2. Configure emacs using the emacs.org file


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/Cellar/cask/0.8.1/cask.el")

;;; Code:
(cask-initialize)

(when (not (cl-remove-if-not
	    (lambda (p) (equal 'org (car p)))
	    package-alist))
  (message "No org-mode package found; installing now...")
  (package-install 'org))

;; You had to do this to get new packages in Cask to install:
; cask install

(require 'org)
(when (string-match "^[1234567]" (org-version))
  (warn "Org-Mode is out of date. We expect org 8 or higher, but instead we have %s" (org-version)))

(require 'pallet)

;; Configure emacs in the org file
(org-babel-load-file "~/.emacs.d/emacs.org")
;;; init.el ends here
