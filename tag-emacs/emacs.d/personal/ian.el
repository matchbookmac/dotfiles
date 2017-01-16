;;; package --- Summary
;; Personal config for Emacs, integrating with Prelude.

;;; Commentary:
;; Prelude offers personal customization via the personal/ dir.

;;; Code:
;; require extra pacakages outside of prelude
(prelude-require-packages '(dash-at-point ag flycheck nlinum yasnippet))

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

;; keybindings
(global-set-key (kbd "C-c C-d d") 'dash-at-point)
(global-set-key (kbd "C-c C-d e") 'dash-at-point-with-docset)

(add-to-list 'auto-mode-alist '("/bash" . sh-mode))
(add-to-list 'auto-mode-alist '("/sh" . sh-mode))

(provide 'ian)
;;; ian.el ends here
