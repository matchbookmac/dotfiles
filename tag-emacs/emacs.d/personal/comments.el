;;; package -- comment or uncomment line

;;; Commentary:
;;; Comment, uncomment lines according to mode

;;; Code:
(defun ian/comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line with no active region."
  (interactive)
  (let ((beginning
         (if (region-active-p) (region-beginning) (line-beginning-position)))
        (end
         (if (region-active-p) (region-end) (line-end-position))))
    (comment-or-uncomment-region beginning end)))

(global-set-key (kbd "C-c ;") 'ian/comment-or-uncomment-region-or-line)

(provide 'comments)
;;; comments.el ends here
