;; melpa and use-package
;; -----------------------------------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; -----------------------------------------------------


;; Moves 'Customize' to distinct file
;; -----------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
;; -----------------------------------------------------


;; Tells Emacs to place tilde files in a special directory.
;; -----------------------------------------------------
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; -----------------------------------------------------

;; Disable tool bar, menu bar, scroll bar.
;; -----------------------------------------------------
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; -----------------------------------------------------


;; For use with sync-TeX and similar applications:
;; -----------------------------------------------------
(server-start)
;; -----------------------------------------------------


;; defaults electric-pair-mode
;; -----------------------------------------------------
(electric-pair-mode 1)
;; -----------------------------------------------------


;; TEST: see if this allows toggling
;; -----------------------------------------------------
(global-set-key (kbd "C-M-&") 'override-global-mode)

;; auto-fill-mode default in all major modes
;; -----------------------------------------------------
(setq-default auto-fill-function 'do-auto-fill)
;; -----------------------------------------------------


;; enable upcase-region and downcase-region
;; -----------------------------------------------------
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; -----------------------------------------------------


;; Highlight current line.
;; -----------------------------------------------------
(global-hl-line-mode t)
;; -----------------------------------------------------


;; Use `command` as `meta` in macOS.
;; -----------------------------------------------------
(setq mac-command-modifier 'meta)
;; -----------------------------------------------------



;;; PACKAGES (buffer-size)

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

	  (add-hook 'TeX-mode-hook 'make-my-slash-backslash)
          (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
	  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))
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
  :ensure t)

(bind-keys*
 ("C-," . avy-goto-char-2)
 ("C-<" . avy-goto-line)
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
(use-package all-the-icons ; General
  :ensure t)

(require 'all-the-icons-gnus) ; Gnus
(all-the-icons-gnus-setup)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode) ; Dired

(all-the-icons-ibuffer-mode 1) ; Ibuffer
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
  :ensure t
  :config (exec-path-from-shell-initialize))
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
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
