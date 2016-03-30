;; -*- Emacs-Lisp -*-
;;
;; Author: Yoshinori Ikarashi <yoosee@init.org>
;;
;;

;; Load-Path
(add-to-list 'load-path "~/local/share/emacs/site-lisp/")
(let ((default-directory "~/local/share/emacs/site-lisp/"))
     (setq load-path
          (append
		(let ((load-path (copy-sequence load-path)))
		(normal-top-level-add-subdirs-to-load-path))
		load-path)))


(load "font-lock")
(setq global-font-lock-mode t)

(setq inhibit-startup-message t)

(menu-bar-mode 0)

(setq make-backup-files nil)
(transient-mark-mode 0)
(iswitchb-mode 1)
(fset `yes-or-no-p `y-or-n-p)

;; Set Linum-Mode on
(global-linum-mode t)
 
;; Linum-Mode and add space after the number
(setq linum-format "%d ")


(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat)
  (terminal-init-bobcat))

;(global-unset-key (kbd "C-b"))

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "C-c q") 'query-replace-regexp)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)
(global-set-key (kbd "C-c n") 'comment-region)
(global-set-key (kbd "C-c m") 'uncomment-region)

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p))
      (save-buffer args)))
(setq auto-save-interval 1
      auto-save-timeout  1)

(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers)
