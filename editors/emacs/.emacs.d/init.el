;;; init.el --- Set up my personal emacs configuration

;;; Commentary:

;; Thanks to Federico Gimenez for
;; https://github.com/fgimenez/.emacs.d/blob/master/init.el

;;; Code:

(global-font-lock-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 200 2))
(setq indent-line-function 'insert-tab)

(require 'package)
(defvar package-list)
(setq package-list '(go-mode js2-mode solidity-mode base16-theme rainbow-delimiters yaml-mode))
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(add-to-list 'auto-mode-alist '("\\.go" . go-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js-indent-level 2)
(require 'solidity-mode)

(column-number-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(load-theme 'base16-onedark t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq org-agenda-files (list "~/Sync/to-do.org"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold))))
(setq org-agenda-window-setup 'current-window)

(provide 'init)
