;;; package --- Summary
;; Personal ruby config for Emacs

;;; Commentary:

;;; code:

;; require extra pacakages outside of prelude
(prelude-require-packages '(bundler rspec-mode rvm))

(rvm-use-default)

(add-hook 'dired-mode-hook 'rspec-dired-mode)

(custom-set-variables
 '(rspec-use-rvm t)
 ;; who uses rake to run rspec. honestly
 '(rspec-use-rake-when-possible nil)
 ;;;;
 ;; # When using rspec snippets:
 ;;
 ;; describe do
 ;;   it "is awesome" { true }
 ;; end
 ;;
 ;; # instead of
 ;;
 ;; RSpec.describe do
 ;;  RSpec.before do
 ;;    self.gag_with_four_fingers
 ;;  end
 ;;  RSpec.it "is so terrible why would you" { true }
 ;; end
 ;;
 '(rspec-expose-dsl-globally t)
 ;; Turn off utf-8 comment insertion in Ruby files
 '(ruby-insert-encoding-magic-comment nil))

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; Files that use ruby syntax
(add-to-list 'auto-mode-alist '("\\irbrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Brewfile\\'" . ruby-mode))

;;; ruby.el ends here
