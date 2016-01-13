(defun ian/load-functions ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "ian/functions")
                                 nil
                                 "\\.el$"))
    (ian/load-init-file (concat "ian/functions/" file))))

(ian/load-functions)
