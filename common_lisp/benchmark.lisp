;; (declaim (optimize (speed 3) (safety 0)))

(load (merge-pathnames "quicklisp/setup.lisp" *load-truename*))
(ql:quickload :cl-ppcre :silent t)
(require :uiop)

(defun measure (data pat)
  (let* ((scanner (cl-ppcre:create-scanner pat))
		 (start (get-internal-real-time))
		 (match-count (cl-ppcre:count-matches scanner data))
		 (elapsed (- (get-internal-real-time) start)))
	(format t "~,3f - ~d~%" (* (/ elapsed internal-time-units-per-second) 1e3) match-count)))

(let ((data (uiop:read-file-string (car uiop:*command-line-arguments*))))
  (measure data "[\\w\\.+-]+@[\\w\\.-]+\\.[\\w\\.-]+")
  (measure data "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?")
  (measure data "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])"))
