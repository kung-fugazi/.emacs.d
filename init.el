;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight current line.
(global-hl-line-mode t)

;; Use `command` as `meta` in macOS.
(setq mac-command-modifier 'meta)

;; Moves 'Customize' to distinct file
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

;; melpa and use-package
;; -----------------------------------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; -----------------------------------------------------


;; use-package-chords
;; -----------------------------------------------------
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))
;; -----------------------------------------------------

;; auctex
;; -----------------------------------------------------
(use-package tex
  :ensure auctex
  :config (setq TeX-auto-save t)
          (setq TeX-parse-self t)
          (setq-default TeX-master nil)
	  (defun make-my-slash-backslash ()
	    (local-set-key (kbd "/") "\\"))

	  (add-hook 'TeX-mode-hook 'make-my-slash-backslash))
;; -----------------------------------------------------


;; iBuffer
;; -----------------------------------------------------
(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer))
;; -----------------------------------------------------


;; avy
;; -----------------------------------------------------
(use-package avy
  :ensure t
  :bind ("C-<" . avy-goto-char-2)
        ("C-," . avy-goto-line)
        ("C-." . avy-goto-char-in-line)
	("C->" . avy-isearch)
	("C-;" . avy-copy-region)
	("C-:" . avy-kill-region))
;; -----------------------------------------------------


;; ace-window
;; -----------------------------------------------------
(use-package ace-window
  :ensure t
  :bind ("C-o" . ace-window)
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))
;; -----------------------------------------------------


;; vi-tilde-fringe
;; -----------------------------------------------------
(use-package vi-tilde-fringe
  :ensure t
  :config (global-vi-tilde-fringe-mode 1))
;; -----------------------------------------------------


;; all-the-icons
;; -----------------------------------------------------
(use-package all-the-icons
  :ensure t)
;; -----------------------------------------------------


;; doom-themes
;; -----------------------------------------------------
(use-package doom-themes
  :ensure t)
;; -----------------------------------------------------


;; doom-modeline
;; -----------------------------------------------------
(use-package doom-modeline
  :ensure t
  :config (doom-modeline-mode 1))
;; -----------------------------------------------------


;; evil
;; -----------------------------------------------------
(use-package evil
  :ensure t
  :config (setq evil-default-state 'emacs)
	  (evil-mode 1))
;; -----------------------------------------------------


;; exec-path-from-shell
;; -----------------------------------------------------
(use-package exec-path-from-shell
  :ensure t)
;; -----------------------------------------------------

;; olivetti
;; -----------------------------------------------------
(use-package olivetti
  :ensure t)
;; -----------------------------------------------------


;; yasnippet
;; -----------------------------------------------------
(use-package yasnippet
  :ensure t)
;; -----------------------------------------------------
