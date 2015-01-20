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


;;; Blaine's stuff

(load-theme 'zenburn)
(custom-set-faces
 '(magit-diff-none ((t (:foreground "white"))))
 '(magit-item-highlight ((t (:background "grey44"))))
 '(minibuffer-prompt ((t (:foreground "black")))))

(add-hook 'after-init-hook #'global-flycheck-mode)

(custom-set-faces
 '(cursor ((t (:background "magenta1" :foreground "magenta")))))

;(set-cursor-color "#48d1cc")

;; Colors in terminal
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(width . 110)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; Backup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq make-backup-files nil)

(global-set-key (kbd "C-c b") 'magit-blame-mode)

'(show-paren-mode t)
