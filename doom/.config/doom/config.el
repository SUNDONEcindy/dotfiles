;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Menlo" :size 14)
      doom-big-font (font-spec :family "Menlo" :size 24)
      global-visual-line-mode t
      )

(after! anaconda-mode
  (set-company-backend! 'anaconda-mode '(company-anaconda company-yasnippet)))

(add-hook! 'prog-mode-hook #'(rainbow-delimiters-mode highlight-quoted-mode))


(add-hook! python-mode
  (rainbow-identifiers-mode)
  (rainbow-delimiters-mode)
  (setq sphinx-doc-mode t
        python-docstring-mode t
        )
  )
