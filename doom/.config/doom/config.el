;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Menlo" :size 14)
      doom-big-font (font-spec :family "Menlo" :size 24)
      global-visual-line-mode t
      which-key-idle-delay 0.001
      +workspaces-on-switch-project-behavior t
      )

(after! anaconda-mode
  (set-company-backend! 'anaconda-mode '(company-anaconda company-yasnippet)))

(add-hook! 'prog-mode-hook #'(rainbow-delimiters-mode global-color-identifiers-mode rainbow-mode highlight-quoted-mode))

(add-hook! prog-mode
  (setq
   company-backends '(company-files company-capf company-dabbrev company-ispell)
   company-minimum-prefix-length 2)
  )


(add-hook! python-mode
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--simple-prompt"
   sphinx-doc-mode t
   python-docstring-mode t))


(after! ein
  (setq
   ;; ein:console-executable ("/usr/local/bin/ipython")
   ein:console-security-dir (expand-file-name "~/Library/Jupyter/runtime")
   ein:console-args
   '((8888 . '("--simple-prompt"))
     (8889 . '("--ssh" "--simple-prompt" "wai"))
     ;; (default . '("--profile" "default"))
     )
   )
  )
