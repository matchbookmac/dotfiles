;;; package -- ruby-extract-method

;;; Commentary:
;;; Extract selection into method

;;; Code:

(require 'ruby-mode)

(defgroup ian/ruby-refactor nil
  "Refactoring helpers for Ruby."
  :version "0.1"
  :group 'files)

(defcustom ian/ruby-refactor-keymap-prefix (kbd "C-c C-e")
  "Ruby-refactor keymap prefix."
  :group 'ian/ruby-refactor
  :type 'sexp)

(defvar ian/ruby-refactor-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key prefix-map (kbd "e") 'ian/ruby-extract-method)
      (define-key map ian/ruby-refactor-keymap-prefix prefix-map))
    map)
  "Keymap to use in ruby refactor minor mode.")

(defun ian/trim-newline-endings (string)
  "Trims newline off front and back of STRING."
  (replace-regexp-in-string "\\(^\n\\|\n$\\)" "" string))

(defun ian/ruby-new-method (method-name method-body)
  "Create a new ruby method given a METHOD-NAME and METHOD-BODY."
  (concat "def " method-name "\n  " method-body "\nend"))

;;;###autoload
(defun ian/ruby-extract-method ()
  "Extracts selection into method."
  (interactive)
  (save-excursion
    (save-restriction
      (save-match-data
        (widen)
        (let* ((beginning
                (if (region-active-p) (region-beginning) (line-beginning-position)))
               (end
                (if (region-active-p) (region-end) (line-end-position)))
               (code-to-extract
                (split-string (ian/trim-newline-endings (buffer-substring-no-properties beginning end)) " = "))
               (extracted-method-name (car (last (split-string (pop code-to-extract)))))
               (extracted-method (ian/ruby-new-method extracted-method-name (mapconcat 'identity code-to-extract " "))))
          (delete-region beginning end)
          (ruby-indent-line)
          (insert (format "%s" extracted-method-name))
          (cond ((search-forward-regexp "^\\s *private" nil "true")
                 (progn
                   (forward-line)
                   (insert (format "\n%s\n" extracted-method))))
                ((search-backward-regexp "^\\s *private" nil "true")
                 (progn
                   (forward-line)
                   (insert (format "\n%s\n" extracted-method))))
                ((progn
                   (goto-char beginning)
                   (search-forward-regexp "^\\s *def" nil "true"))
                 (progn
                   (forward-line 0)
                   (insert (format "%s\n\n" extracted-method))))
                ((progn
                   (goto-char beginning)
                   (search-backward-regexp "^\\s *def" nil "true"))
                 (progn
                   (insert (format "%s\n\n" extracted-method)))))
          (search-backward-regexp "^\\s *def")
          (indent-region (point)
                         (progn
                           (forward-paragraph)
                           (point))))))))

;;;###autoload
(define-minor-mode ian/ruby-refactor-mode
  "Ruby Refactor minor mode"
  :global nil
  :group 'ian/ruby-refactor
  :keymap ian/ruby-refactor-mode-map
  :lighter " Ian/RubyRef")

;;;###autoload
(defun ian/ruby-refactor-mode-launch ()
  "Turn on `ruby-refactor-mode'."
  (ian/ruby-refactor-mode 1))

;;;###autoload
(add-hook 'ruby-mode-hook 'ian/ruby-refactor-mode-launch)

(provide 'ruby-extract-method)
;;; ruby-extract-method.el ends here
