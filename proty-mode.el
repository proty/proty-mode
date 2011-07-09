(defvar proty-keywords
  '("while" "if" "else" "do" "try" "catch" "end")
  "Proty keywords.")

(defvar proty-constants
  '("true" "false" "nil")
  "Proty constants.")

(defvar proty-keywords-regexp
  (regexp-opt proty-keywords 'words))

(defvar proty-constants-regexp
  (regexp-opt proty-constants 'words))

;; clear memory
(setq proty-keywords nil)
(setq proty-constants nil)

(setq proty-font-lock-keywords
      `(
        (,proty-keywords-regexp . font-lock-keyword-face)
        (,proty-constants-regexp . font-lock-constant-face)
))

(define-derived-mode proty-mode fundamental-mode
  "Proty"
  "Major mode for the Proty Programming Language"

  (setq font-lock-defaults '((proty-font-lock-keywords)))

  ;; clear memory
  (setq proty-keywords-regexp nil)
  (setq proty-constants-regexp nil)
)

;;;###autoload
(setq auto-mode-alist
  (cons '("\\.pr" . proty-mode) auto-mode-alist))

(provide 'proty-mode)
