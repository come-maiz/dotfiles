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

(column-number-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init)
;;; init.el ends here
