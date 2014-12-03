;;; uo-python-module.el -- Find dotted python modulepackage: Summary

;;; Commentary:

;;; uo-python-module-for-file gets the python module relative to the git root

;;; Code:
(require 's)

(defun uo-rel-file-path ()
  (let ((root (expand-file-name (vc-git-root (buffer-file-name)))))
    (cadr (s-split root (buffer-file-name)))))

(defun uo-rel-path-to-dotted (rel-file-path)
  (s-replace ".py" "" (s-replace "/" "." rel-file-path)))

(defun uo-python-module-for-file ()
  (interactive)
  (message (uo-rel-path-to-dotted (uo-rel-file-path))))

(provide 'uo-python-module)
;;; uo-python-module ends here
