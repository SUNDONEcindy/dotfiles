;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Farina"
      user-mail-address "johnfarina@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Menlo" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(add-hook! 'prog-mode-hook #'(rainbow-delimiters-mode global-color-identifiers-mode rainbow-mode highlight-quoted-mode))

(after! rainbow-delimiters-mode
  ;; more colors for parens
  (setq rainbow-delimiters-max-face-count 6))

;; quickhelp popups (ony in GUI emacs) to the right of completion candidates
;; (company-quickhelp-mode)

(after! avy
  ;; use `gs SPC (start typing the word you're looking at)` to jump to text in any open window
  (setq avy-all-windows t))

;; python repls popup to the right
(set-popup-rules!
  '(("^\\*Python"  :side right :width 0.4 :height 0.5 :select f :slot 0 :vslot 0 :quit nil)
    ("^\\*jupyter-repl"  :side right :width 0.4 :height 0.5 :select f :slot 0 :vslot 0 :quit nil)))

(after! lsp-mode
  (setq
    ;; no automatic docstring popup buffer at the bottom, since it gets in the way
    lsp-signature-auto-activate nil
    lsp-signature-doc-lines nil

    ;; lsp-ui-doc-max-height 40
    ;; lsp-ui-doc-header t
    lsp-ui-doc-enable t
    lsp-ui-doc-delay 0
    read-process-output-max (* 1024 1024)))

(after! company
  ;; quickhelp popups (ony in GUI emacs) to the right of completion candidates
  (company-quickhelp-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; have emacs-jupyter paste code into the repl instead of just putting the
;; output in the *messages* buffer
(setq jupyter-repl-echo-eval-p t)

;; TAB on an org-mode section header cycles in the usual way
(after! evil-org
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))

(setq
  ;; can't be wrapped in after! because this needs to happen *before* whick-key is enabled
  which-key-idle-delay 0.1
  which-key-max-display-columns 6
  which-key-max-description-length 'nil)


;; don't extend comments with o/O
(setq +evil-want-o/O-to-continue-comments 'nil)

;; keymaps
(map! :map ein:notebook-mode-map
      :localleader
      "," #'+ein/hydra/body)
