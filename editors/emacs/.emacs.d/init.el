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
(setq package-list '(go-mode))
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(add-to-list 'auto-mode-alist '("\\.go" . go-mode))


(column-number-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init)
;;; init.el ends here
