;;; Commentary

;; disable emacs menubar
(menu-bar-mode -1)

;; use guru mode to disable noob keys
(setq guru-warn-only nil)

;; require the silver searcher
(prelude-require-package 'ag)

;; keybindings
(global-set-key (kbd "C-c ;") 'ian/comment-or-uncomment-region-or-line)
