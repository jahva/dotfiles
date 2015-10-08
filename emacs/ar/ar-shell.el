;;; ar-shell.el --- Shell support.

;;; Commentary:
;; Shell helpers.

(require 'comint)

(defun ar/shell-cd (dir-path)
  "Change shell current working directory to DIR-PATH."
  (unless (string-equal mode-name "Shell")
    (error "Not in Shell mode"))
  (message mode-name)
  (goto-char (point-max))
  (comint-kill-input)
  (insert (concat "cd " (shell-quote-argument dir-path)))
  (let ((comint-process-echoes t))
    (comint-send-input)))

(provide 'ar-shell)

;;; ar-shell.el ends here