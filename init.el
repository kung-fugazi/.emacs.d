;;;; My Emacs Init File (~/.emacs.d/init.el)

;;;; NOTES
;; Favorite background color: #121a21
;; Favorite default font color: #e6e1cf

;; Enables melpa and use-package
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


;;;; CONFIGURATION

;; Moves 'Customize' to distinct file
;; -----------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
;; -----------------------------------------------------


;; Fixes when Emacs opens in iTerm2
;; -----------------------------------------------------
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)
;; -----------------------------------------------------


;; Stops Emacs from asking if a theme is safe
;; -----------------------------------------------------
(setq custom-safe-themes t)
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


;; For resolving keybinding conflicts
;; -----------------------------------------------------
(global-set-key (kbd "C-M-&") 'override-global-mode)
;; -----------------------------------------------------


;; Sets M-n as delete-backward-char and M-N as kill-whole-line
;; -----------------------------------------------------
(global-set-key (kbd "M-n") 'delete-backward-char)
(global-set-key (kbd "M-N") 'kill-whole-line)
;; -----------------------------------------------------


;; auto-fill-mode default in all major modes
;; -----------------------------------------------------
(setq-default auto-fill-function 'do-auto-fill)
;; -----------------------------------------------------


;; Un-disables (double negative... tricky) some advanced functions
;; -----------------------------------------------------
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
;; -----------------------------------------------------


;; Highlight current line.
;; -----------------------------------------------------
(global-hl-line-mode t)
;; -----------------------------------------------------


;; Use `command` as `meta` in macOS.
;; -----------------------------------------------------
(setq mac-command-modifier 'meta)
;; -----------------------------------------------------


;; Maximize frame
;; -----------------------------------------------------
(global-set-key (kbd "M-C-,") 'toggle-frame-maximized)
;; -----------------------------------------------------




;;;; FUNCTIONS

;; Moves focus to iTerm2
;; -----------------------------------------------------
(defun os-switch-to-iTerm2 ()
  (interactive)
  (when (display-graphic-p)
    (do-applescript "tell application \"iTerm2\" to activate")))

(global-set-key (kbd "C-`") 'os-switch-to-iTerm2)
;; -----------------------------------------------------



;;;; PACKAGES (buffer-size)

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
	  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
          (add-hook 'LaTeX-mode-hook 'olivetti-mode)
	  (add-hook 'LaTeX-mode-hook
                 (lambda ()
                   (make-local-variable 'olivetti-body-width)
		   (setq olivetti-body-width 110))))
;; -----------------------------------------------------


;; iBuffer
;; -----------------------------------------------------
(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer))
;; -----------------------------------------------------


;; all-the-icons
;; -----------------------------------------------------
(require 'all-the-icons)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode) ; Dired

(all-the-icons-ibuffer-mode 1) ; Ibuffer
;; -----------------------------------------------------


;; avy
;; -----------------------------------------------------
(use-package avy
  :ensure t)

(bind-keys*
 ("C-," . avy-goto-char-2)
 ("C-<" . avy-goto-line)
 ("C-." . avy-goto-char-in-line)
 ("C->" . avy-goto-char)
 ("C-;" . avy-copy-region)
 ("C-:" . avy-kill-region))
;; -----------------------------------------------------


;; ace-window
;; -----------------------------------------------------
(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window)
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))
;; -----------------------------------------------------


;; vi-tilde-fringe
;; -----------------------------------------------------
(use-package vi-tilde-fringe
  :ensure t
  :config (global-vi-tilde-fringe-mode 1))
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


;; evil-mode
;; -----------------------------------------------------
(use-package evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))
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
