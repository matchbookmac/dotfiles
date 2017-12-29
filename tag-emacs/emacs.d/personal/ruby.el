;;; package --- Summary
;; Personal ruby config for Emacs

;;; Commentary:

;;; Code:
;; require extra pacakages outside of prelude
;; (prelude-require-packages '(bundler rspec-mode rvm))
(prelude-require-packages '(emamux emamux-ruby-test))

;; (global-set-key (kbd "C-c M-b o") 'bundle-open)
;; (global-set-key (kbd "C-c M-b c") 'bundle-console)
;; (global-set-key (kbd "C-c M-b i") 'bundle-install)
;; (global-set-key (kbd "C-c M-b u") 'bundle-update)
;; (global-set-key (kbd "C-c M-b e") 'bundle-exec)

;; (rvm-use-default)

;; (add-hook 'dired-mode-hook 'rspec-dired-mode)

(require 'emamux)
(require 'emamux-ruby-test)
(add-hook 'ruby-mode-hook 'emamux-ruby-test-mode)

(global-set-key (kbd "C-z") emamux:keymap)

(custom-set-variables
 '(emamux-ruby-test-keymap-prefix (kbd "C-c C-t")))

(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on 'ctags-auto-update-mode'." t)
(add-hook 'ruby-mode-hook  'turn-on-ctags-auto-update-mode)

;; (defun ian-ruby-mode-defaults ()
;;   "Turn of inf ruby and ruby tools."
;;   (print "turn off defaults")
;;   (inf-ruby-minor-mode -1)
;;   (ruby-tools-mode -1))

;; (setq ian-ruby-mode-hook 'ian-ruby-mode-defaults)

;; (add-hook 'ruby-mode-hook (lambda ()
;;                             (run-hooks 'ian-ruby-mode-hook)))
;; (inf-ruby-minor-mode -1)
;; (ruby-tools-mode -1)

;; (defun prelude-ruby-mode-defaults ()
;;   (inf-ruby-minor-mode -1)
;;   (ruby-tools-mode -1)
;;   ;; CamelCase aware editing operations
;;   (subword-mode +1))

;; (unload-feature 'inf-ruby)
;; (unload-feature 'inf-ruby-minor-mode)

;; (add-hook 'ruby-mode-hook (lambda ()
;;                             (print "turn off defaults")
;;                             (inf-ruby-minor-mode -1)
;;                             (ruby-tools-mode -1)))


;; (custom-set-variables
;;  '(rspec-use-rvm t)
;;  ;; who uses rake to run rspec. honestly
;;  '(rspec-use-rake-when-possible nil)
;;  ;;;;
;;  ;; # When using rspec snippets:
;;  ;;
;;  ;; describe do
;;  ;;   it "is awesome" { true }
;;  ;; end
;;  ;;
;;  ;; # instead of
;;  ;;
;;  ;; RSpec.describe do
;;  ;;  RSpec.before do
;;  ;;    self.gag_with_four_fingers
;;  ;;  end
;;  ;;  RSpec.it "is so terrible why would you" { true }
;;  ;; end
;;  ;;
;;  '(rspec-expose-dsl-globally t)
;;  ;; Turn off utf-8 comment insertion in Ruby files
;;  '(ruby-insert-encoding-magic-comment nil))

;; (eval-after-load 'rspec-mode
;;   '(rspec-install-snippets))

;; Files that use ruby syntax
(add-to-list 'auto-mode-alist '("\\ruby\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\irbrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Brewfile\\'" . ruby-mode))

(provide 'ruby)
;;; ruby.el ends here
