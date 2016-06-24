;;; package --- Summary
;; Personal config for Emacs prelude

;;; Commentary:

;;; code:

;; disable Emacs menubar
(menu-bar-mode -1)

;; use guru mode to disable noob keys
(setq guru-warn-only nil)

;; require the silver searcher
(prelude-require-packages '(dash-at-point ag))

;; keybindings
(global-set-key (kbd "C-c ;") 'ian/comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-d d") 'dash-at-point)
(global-set-key (kbd "C-c C-d e") 'dash-at-point-with-docset)

(setq whitespace-line-column 120) ;; limit line length

;;; ian.el ends here
