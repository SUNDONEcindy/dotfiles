;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(when (string-match "darwin" (symbol-name system-type))
  (setq doom-font (font-spec :family "Menlo" :size 16)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(setq doom-dracula-brighter-comments t
      doom-dracula-comment-bg t
      doom-dracula-colorful-headers t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (add-hook! 'prog-mode-hook #'(rainbow-delimiters-mode global-color-identifiers-mode rainbow-mode highlight-quoted-mode))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'global-color-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'highlight-quoted-mode)

(after! rainbow-delimiters-mode
  ;; more colors for parens
  (setq rainbow-delimiters-max-face-count 6))

;; quickhelp popups (ony in GUI emacs) to the right of completion candidates
;; (company-quickhelp-mode)
(setq conda-anaconda-home (expand-file-name "~/.pyenv/versions/mambaforge"))

(after! magit
  ;; magit open in a vertical split instead of using the current window
  (setq magit-display-buffer-function #'magit-display-buffer-traditional))

(after! avy
  ;; use `gs SPC (start typing the word you're looking at)` to jump to text in any open window
  (setq avy-all-windows t))

;; python repls popup to the right
(set-popup-rules!
  '(("^\\*Python"  :side right :width 0.4 :height 0.5 :select f :slot 0 :vslot 0 :quit nil)
    ("^\\*jupyter-repl"  :side right :width 0.4 :height 0.5 :select f :slot 0 :vslot 0 :quit nil)))

;; python prompt warning suppression
(after! python-mode
  (setq python-shell-prompt-detect-failure-warning nil))

;; (setq-hook! 'lsp-mode-hook
;;   company-backends (cons '(company-lsp :separate company-capf company-yasnippet company-files) company-backends))


(after! lsp-mode
  (setq
   ;; no automatic docstring popup buffer at the bottom, since it gets in the way
   ;; lsp-signature-auto-activate nil
   ;; lsp-signature-doc-lines nil

   ;; lsp-ui-doc-max-height 40
   ;; lsp-ui-doc-header t
   lsp-ui-doc-enable t
   lsp-ui-doc-delay 0
   read-process-output-max (* 1024 1024))
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.venv\\'"))

(after! company
  ;; quickhelp popups (ony in GUI emacs) to the right of completion candidates
  (company-quickhelp-mode)
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.5))

;; (after! company-box
;;   company-box-doc-enable nil)

;; have emacs-jupyter paste code into the repl instead of just putting the
;; output in the *messages* buffer
(setq jupyter-repl-echo-eval-p t)

;; use jupyter's lookup (bound to ~k~) for documentation in jupyter buffers
(after! jupyter
  (set-lookup-handlers! '(jupyter-repl-mode jupyter-org-interaction-mode jupyter-repl-interaction-mode)
    :documentation '(jupyter-inspect-at-point :async t)))

;; TAB on an org-mode section header cycles in the usual way
(after! evil-org
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))

(setq
 ;; can't be wrapped in after! because this needs to happen *before* whick-key is enabled
 which-key-idle-delay 0.1
 which-key-max-display-columns 6
 which-key-max-description-length 'nil)

;; n/N insted of ;/, to repeat searches etc
(setq +evil-repeat-keys '("n" . "N"))

;; make s/S, f/F, t/T search for next in whole buffer, instead of the default
;; current line
(setq evil-snipe-scope 'buffer)

;; n/N in addition to ;/, to repeat evil-snipe searches
(after! evil-snipe
  (let ((map evil-snipe-parent-transient-map))
    (define-key map "n" #'evil-snipe-repeat)
    (define-key map "N" #'evil-snipe-repeat-reverse)))

;; don't extend comments with o/O
(setq +evil-want-o/O-to-continue-comments 'nil)

;; make undo more fine-grained
(setq evil-want-fine-undo t)

;; Make * use symbol boundaries instead of word boundaries
(setq evil-symbol-word-search t)

;; sort which-key alphabetically, with group prefixes at the end
(defun my-which-key-key-order-alpha (acons bcons)
  (let ((apref? (which-key--group-p (cdr acons)))
        (bpref? (which-key--group-p (cdr bcons))))
    (if (not (eq apref? bpref?))
        (and (not apref?) bpref?)
      (which-key--key-description< (car acons) (car bcons) t))))

(setq which-key-sort-order 'my-which-key-key-order-alpha)

;; reload buffers when the associated file on disk changes
(global-auto-revert-mode 1)
;; and do so after 1 second (default is 5 seconds)
(setq auto-revert-timer 1)

;; reuse normal ssh controlmaster option from ~/.ssh/config
(setq tramp-ssh-controlmaster-options "")

;; from an ivy buffer, C-o will show a list of available actions in a hydra
;; above the ivy buffer
(setq ivy-read-action-function #'ivy-hydra-read-action)
;; alternatively, show a list of available actions directly in the ivy buffer
;; (replaces contents of your current ivy buffer and exiting seems slower)
;; (setq ivy-read-action-function #'ivy-read-action-ivy)

;; larger scrollback buffer in vterm
(setq vterm-max-scrollback 100000)

;; keymaps
(map! :map ein:notebook-mode-map
      :localleader
      "," #'+ein/hydra/body)

;; unfuck company keybindings
;; Specifically, this seems to fix the C-j/C-k for selecting next/previous
;; completion candidate, which sometimes breaks without this garbage hack
(after! company
  (add-hook 'company-completion-started-hook 'custom/set-company-maps)
  (add-hook 'company-completion-finished-hook 'custom/unset-company-maps)
  (add-hook 'company-completion-cancelled-hook 'custom/unset-company-maps))

(defun custom/unset-company-maps (&rest unused)
  "Set default mappings (outside of company).
    Arguments (UNUSED) are ignored."
  (general-def
    :states 'insert
    :keymaps 'override
    "<down>" nil
    "<up>"   nil
    "RET"    nil
    [return] nil
    "C-n"    nil
    "C-p"    nil
    "C-j"    nil
    "C-k"    nil
    "C-h"    nil
    "C-u"    nil
    "C-d"    nil
    "C-s"    nil
    "C-S-s"   (cond ((featurep! :completion helm) nil)
                    ((featurep! :completion ivy)  nil))
    "C-SPC"   nil
    "TAB"     nil
    [tab]     nil
    [backtab] nil))

(defun custom/set-company-maps (&rest unused)
  "Set maps for when you're inside company completion.
    Arguments (UNUSED) are ignored."
  (general-def
    :states 'insert
    :keymaps 'override
    "<down>" #'company-select-next
    "<up>" #'company-select-previous
    "RET" #'company-complete
    [return] #'company-complete
    "C-w"     nil  ; don't interfere with `evil-delete-backward-word'
    "C-n"     #'company-select-next
    "C-p"     #'company-select-previous
    "C-j"     #'company-select-next
    "C-k"     #'company-select-previous
    "C-h"     #'company-show-doc-buffer
    "C-u"     #'company-previous-page
    "C-d"     #'company-next-page
    "C-s"     #'company-filter-candidates
    "C-S-s"   (cond ((featurep! :completion helm) #'helm-company)
                    ((featurep! :completion ivy)  #'counsel-company))
    "C-SPC"   #'company-complete-common
    "TAB"     #'company-complete-common-or-cycle
    [tab]     #'company-complete-common-or-cycle
    [backtab] #'company-select-previous))

;; hack to get rid of the following stupid errors:
;; Error during redisplay: (eval (doom-modeline-segment--workspace-name)) signaled (void-function tab-bar--current-tab)
(setq doom-modeline-workspace-name nil)

(setq poetry-tracking-strategy 'projectile)

;; forge stuff
(after! forge
  (add-to-list 'auth-sources "~/.authinfo"))

;; Eglot uses project.el to detect the project root. This is a workaround to make it work with projectile:
(after! eglot
  ;; A hack to make it works with projectile
  (defun projectile-project-find-function (dir)
    (let* ((root (projectile-project-root dir)))
      (and root (cons 'transient root))))

  (with-eval-after-load 'project
    (add-to-list 'project-find-functions 'projectile-project-find-function)))

;; pyenv integration with projectile
;; ou can switch Python versions together with your current project. Drop the
;; following lines into your Emacs init file. When you use projectile switch
;; project pyenv-mode will activate the environment
;; matched to the project's name.
(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)


;; having evil- appear in so many popups is a bit too verbose, let’s change
;; that, and do a few other similar tweaks while we’re at it.
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))
