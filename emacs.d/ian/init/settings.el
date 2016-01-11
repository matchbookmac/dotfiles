(defun ian/load-settings ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "ian/settings")
                                 nil
                                 "\\.el$"))
    (ian/load-init-file (concat "ian/settings/" file))))

(ian/load-settings)
