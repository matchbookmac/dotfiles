;;; package --- Summary
;; Personal config for Emacs, integrating with Prelude.

;;; Commentary:
;; Prelude offers personal customization via the personal/ dir.

;;; Code:
;; require extra pacakages outside of prelude
(prelude-require-packages '(dash-at-point
                            ag
                            fzf
                            flycheck
                            nlinum
                            yasnippet
                            markdown-mode
                            etags-table
                            ctags-update
                            helm-etags-plus))

;; disable Emacs menubar
(menu-bar-mode -1)

;; Turn on yas snippets
(yas-global-mode)

(custom-set-variables
 ;; use guru mode to disable noob keys
 '(guru-warn-only nil)
 ;; use sbcl for Common Lisp
 '(inferior-lisp-program "sbcl")
 ;; JavaScript 2 spaces for tab
 '(js2-basic-offset 2)
 ;; Line numbers, add space after
 '(nlinum-format "%d ")
 ;; Don't tabify after rectangle commands
 '(cua-auto-tabify-rectangles nil)
 ;; limit line length
 '(whitespace-line-column 120)
 '(org-agenda-files (list "~/Dropbox/org/work.org"
                          "~/Dropbox/org/home.org")))

;; cua-mode https://www.emacswiki.org/emacs/CuaMode
(cua-mode t)
(cua-selection-mode t)
;; No region when it is not highlighted
(transient-mark-mode 1)

(require 'etags-table)
(setq etags-table-alist
      (list
       '("~/code/.*\\.\\([rb]\\)" "~/code/*/TAGS")
       ))
(setq etags-table-search-up-depth 10)
(add-hook 'helm-etags-plus-select-hook 'etags-table-recompute)

;; keybindings
(global-set-key (kbd "C-c C-d d") 'dash-at-point)
(global-set-key (kbd "C-c C-d e") 'dash-at-point-with-docset)
(global-set-key (kbd "M-g g") 'goto-line)

;; Show line numbers when using goto-line
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (nlinum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (nlinum-mode -1)))

;; In dired, M-> and M- never take me where I want to go.
;; That is, now they do.
;; Instead of taking me to the very beginning or very end, they now take me to the first or last file.
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(add-to-list 'auto-mode-alist '("/bash" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sh" . sh-mode))

(provide 'ian)
;;; ian.el ends here
