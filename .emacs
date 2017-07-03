;; -*- origami-fold-style: triple-braces -*-
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
 '(custom-enabled-themes (quote (misterioso)))
 '(safe-local-variable-values (quote ((origami-fold-style . triple-braces)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))

; Global key rebindings
; ,gs should run git status
(defun moosh-git-status()
  (interactive)
  (shell-command "git status"))
(global-set-key (kbd "C-, C-g C-s") 'moosh-git-status)

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
(global-set-key (kbd "C-, C-m C-c") 'moosh-run-unittests)

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

; enable company mode for auto completion
(add-hook 'after-init-hook 'global-company-mode)

; Use 4 spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

                                        ; Code/text folding
                                        ;{{{
(require 'origami)
(global-origami-mode)
(global-set-key (kbd "C-, C-z C-o") 'origami-open-node)
(global-set-key (kbd "C-, C-z C-c") 'origami-close-node)
(global-set-key (kbd "C-, C-z C-z") 'origami-toggle-all-nodes)
                                        ;}}}

                                        ; this opens a menu to the side with all the open buffers
                                        ;{{{
(require 'sr-speedbar)
(speedbar-change-initial-expansion-list "buffers")
(global-set-key (kbd "C-, C-b") 'sr-speedbar-toggle)
                                        ;}}}
