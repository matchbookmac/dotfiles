;;; package --- Summary
;; Personal config for Emacs prelude

;;; Commentary:

;;; code:

;; disable Emacs menubar
(menu-bar-mode -1)

;; use guru mode to disable noob keys
(setq guru-warn-only nil)

;; use sbcl for Common Lisp
(setq inferior-lisp-program "sbcl")

;; JS 2 spaces for tab
(setq js2-basic-offset 2)

;; require the silver searcher and dash
(prelude-require-packages '(dash-at-point ag flycheck))

;; keybindings
(global-set-key (kbd "C-c ;") 'ian/comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-d d") 'dash-at-point)
(global-set-key (kbd "C-c C-d e") 'dash-at-point-with-docset)

(setq whitespace-line-column 120) ;; limit line length

;; Files that use ruby syntax
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Brewfile\\'" . ruby-mode))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/home.org"))

;;; ian.el ends here
