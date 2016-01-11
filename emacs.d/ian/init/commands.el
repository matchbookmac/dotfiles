(defun ian/load-commands ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "ian/commands")
                                 nil
                                 "\\.el$"))
    (ian/load-init-file (concat "ian/commands/" file))))

(ian/load-commands)
