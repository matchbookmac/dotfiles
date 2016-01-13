;; Ian's Emacs configuration
;; Mostly stolen from JEG2: https://github.com/JEG2/dotfiles.git

; https://github.com/bbatsov/prelude/issues/896#issuecomment-147779817
; a temp fix that can be removed in Emacs 25:
;(setq tramp-ssh-controlmaster-options)

(defun ian/load-init-file (path &optional noerror)
  "This loads a file from inside the the .emacs.d directory"
  (let ((file (file-name-sans-extension
               (expand-file-name path user-emacs-directory))))
    (load file noerror)))

; okay
;; load configuration settings by type
;(jeg2/load-init-file "jeg2/init/freshen")
;(jeg2/load-init-file "jeg2/init/system")
;(jeg2/load-init-file "jeg2/init/autoloads")
(ian/load-init-file "ian/init/packages")
(ian/load-init-file "ian/init/settings")
(ian/load-init-file "ian/init/commands")
(ian/load-init-file "ian/init/functions")
;(jeg2/load-init-file "jeg2/init/compile")
(ian/load-init-file "ian/init/autohooks")

