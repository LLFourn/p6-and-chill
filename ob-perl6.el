;;; ob-perl6.el --- Execute Perl 6 within org-mode blocks

;;; Commentary:
;;
;; run Perl 6 snippets


;;; Code:
(require 'org)
(require 'ob)


(defgroup ob-perl6 nil
  "org-mode blocks for Perl 6"
  :group 'org)

(defcustom ob-perl6:default-perl6 nil
  "Default perl6 interpreter to use"
  :group 'ob-perl6
  :type 'string
  )


;;;###autoload
(defun org-babel-execute:perl6 (body params)
  "org-babel perl6 hook."
  (let* ((lib (cdr (assoc :lib params)))
         (include (if lib (concat "-I'" lib "'") nil))
         (stdin-program (unless (assoc :repl params) "-"))
         (cmd (list "perl6" include stdin-program)))

    (org-babel-eval (mapconcat 'identity cmd " ") body)
    )
  )


;;;###autoload
(eval-after-load "org"
  '(add-to-list 'org-src-lang-modes '("perl6" . perl6)))

(provide 'ob-perl6)



;;; ob-perl6.el ends here
