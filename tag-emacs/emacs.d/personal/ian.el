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

;; require extra pacakages outside of prelude
(prelude-require-packages '(dash-at-point ag flycheck nlinum yasnippet))

(yas-global-mode)

;; Line numbers, add space after
(setq nlinum-format "%d ")

;; cua-mode https://www.emacswiki.org/emacs/CuaMode
(cua-mode t)
(cua-selection-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;; keybindings
(global-set-key (kbd "C-c ;") 'ian/comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-d d") 'dash-at-point)
(global-set-key (kbd "C-c C-d e") 'dash-at-point-with-docset)

(setq whitespace-line-column 120) ;; limit line length

(defun copy-from-osx ()
  "Use OSX clipboard to paste."
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  "Add kill ring entries (TEXT) to OSX clipboard.  PUSH."
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/home.org"))

;;; ian.el ends here
