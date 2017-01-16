;;; package --- Summary
;; Configure emacs to itegrate with OSX.

;;; Commentary:
;; Kill ring and OSX clipboard don't play nice.  Make them work together.

;;; Code:
(defun copy-from-osx ()
  "Use OSX clipboard to paste."
  (shell-command-to-string "reattach-to-user-namespace pbpaste"))

(defun paste-to-osx (text &optional push)
  "Add kill ring entries (TEXT) to OSX clipboard.  PUSH."
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "reattach-to-user-namespace" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(provide 'osx)
;;; osx.el ends here
