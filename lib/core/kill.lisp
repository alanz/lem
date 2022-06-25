(in-package :lem)

(export '(with-killring
          kill-push
          kill-ring-rotate
          kill-ring-rotate-undo
          kill-ring-new))

(defvar *kill-before-p* nil)
(defvar *kill-options* '())

(defvar *killring* (make-killring 10))

(defun call-with-killring (function &key options before new)
  (let ((*kill-options* options)
        (*kill-before-p* before))
    (when new
      (kill-ring-new))
    (funcall function)))

(defmacro with-killring ((&key options before new) &body body)
  `(call-with-killring (lambda () ,@body)
                       :options ,options
                       :before ,before
                       :new ,new))

(defun kill-push (string)
  (let ((element (killring-add *killring*
                               (make-killring-element string *kill-options*)
                               *kill-before-p*)))
    (when (enable-clipboard-p)
      (copy-to-clipboard (killring-element-string element)))
    element))

(defun current-kill-ring (&key (use-clipboard (enable-clipboard-p)))
  (or (and use-clipboard (get-clipboard-data))
      (killring-nth *killring* 0)))

(defun kill-ring-nth (n)
  (check-type n (integer 0 *))
  (killring-nth *killring* n))

(defun kill-ring-rotate ()
  (killring-rotate *killring*))

(defun kill-ring-rotate-undo ()
  (killring-rotate-undo *killring*))

(defun kill-ring-new ()
  (killring-new *killring*))
