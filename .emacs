(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))

; evil-mode configuration
; Setup packages we use
;(require 'evil)
;(require 'key-chord)
;(require 'evil-tabs)
;(evil-mode 1)
;(key-chord-mode 1)
;(global-evil-tabs-mode t)

; Make kj escape from insert mode
;(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

; tab manipulation
;(define-key evil-normal-state-map ",/" 'elscreen-next)
;(define-key evil-normal-state-map ",," 'elscreen-previous)
;(define-key evil-normal-state-map ",q" 'elscreen-kill)

;(define-key evil-normal-state-map ",oi" 'evil-tabs-tabedit)

; Global key rebindings
; ,gs should run git status
(defun moosh-git-status()
  (interactive)
  (shell-command "git status"))
;(define-key evil-normal-state-map ",gs" 'moosh-git-status)

; ,tt should open a terminal to the right of the buffer
(defun moosh-open-terminal()
  (interactive)
  (split-window-right)
  (other-window 1)
  (term "/bin/bash"))
;(define-key evil-normal-state-map ",tt" 'moosh-open-terminal)

; ,mc should run the unittests
(defun moosh-run-unittests()
  (interactive)
  (shell-command "python3 -m unittest"))
;(define-key evil-normal-state-map ",mc" 'moosh-run-unittests)

(defun moosh-edit-init-file()
  (interactive)
  (find-file "~/.emacs"))
;(define-key evil-normal-state-map ",ve" 'moosh-edit-init-file)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-, C-d") 'duplicate-line)
(add-hook 'after-init-hook 'global-company-mode)
(setq-default indent-tabs-mode nil)
; {{{
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
; }}}

(require 'sr-speedbar)
(speedbar-change-initial-expansion-list "buffers")
(global-set-key (kbd "C-, C-b") 'sr-speedbar-toggle)
