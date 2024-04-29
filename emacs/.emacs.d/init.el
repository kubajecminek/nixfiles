(defconst emacs-start-time (current-time))

(defun report-time-since-load (&optional suffix)
  (message "Loading init...done (%.3fs)%s"
           (float-time (time-subtract (current-time) emacs-start-time))
           suffix))

(add-hook 'after-init-hook
          #'(lambda () (report-time-since-load " [after-init]"))
          t)

(let ((modules '("core.el" "gnus.el" "org.el" "external.el"))
      (func '(lambda (module)
               (load-file
                (expand-file-name module
                                  "~/.emacs.d/")))))
  (mapcar func modules))
