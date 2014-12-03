;;; uo-python-module.el -- Find dotted python modulepackage: Summary

;;; Commentary:

;;; uo-python-module-for-file gets the python module relative to the git root

;;; Code:
(require 's)

(defun uo-rel-file-path ()
  (let ((root (vc-git-root (buffer-file-name))))
    (file-relative-name (buffer-file-name) root)))

(defun uo-rel-path-to-dotted (rel-file-path)
  (file-name-sans-extension (s-replace "/" "." rel-file-path)))

(defun uo-python-module-for-file ()
  (interactive)
  (message (uo-rel-path-to-dotted (uo-rel-file-path))))

(provide 'uo-python-module)
;;; uo-python-module ends here
