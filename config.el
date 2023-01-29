;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Steve Van de Vyver"
      user-mail-address "strazil001@gmail.com")

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
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 12)
      doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
      projectile-project-search-path '("~/code/"))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)

(setq evil-default-cursor t) ;; Now evil takes the default cursors
(setq default-frame-alist '((cursor-color . "#fab387")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

(setq web-mode-auto-close-style 2)

(use-package! org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "🚀" "💀" "🍺")))

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(add-hook 'prog-mode-hook 'format-all-mode)
;; Tabbar
;;(use-package! centaur-tabs
;;  :demand
;;  :config
;;  (centaur-tabs-mode t)
;;  (setq centaur-tabs-style "rounded"
;;        centaur-tabs-height 25
;;        centaur-tabs-set-icons t
;;        centaur-tabs-modified-marker "●"
;;        centaur-tabs-show-new-tab-button nil
;;        centaur-tabs-set-bar 'under
;;        ;; Note: If you're not using Spacmeacs, in order for the underline to display
;;        ;; correctly you must add the following line:
;;        x-underline-at-descent-line t
;;        centaur-tabs-set-close-button nil)
;;  :bind
;;  (:map evil-normal-state-map
;;        ("g t" . centaur-tabs-forward)
;;        ("g T" . centaur-tabs-backward)))

(after! treemacs
  (use-package! treemacs
    :ensure t
    :config
    (setq treemacs-git-mode 'extended
          treemacs-width 30
          treemacs-tag-follow-cleanup t
          treemacs-tag-follow-delay 1.5
          treemacs-indent-guide-style 'line
          treemacs-follow-mode t
          doom-themes-treemacs-theme "doom-colors"
          treemacs-filewatch-mode t)))

(use-package! doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package! all-the-icons
  :ensure t
  :config
  (setq doom-modeline-icon t
        doom-modeline-hud t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-time-icon t
        doom-modeline-time t
        doom-modeline-highlight-modified-buffer-name t
        doom-modeline-buffer-modification-icon t
        doom-modeline-buffer-name t
        doom-modeline-enable-word-count t
        doom-modeline-buffer-encoding t
        doom-modeline-indent-info t
        doom-modeline-workspace-name t
        doom-modeline-modal t
        doom-modeline-modal-icon t
        doom-modeline-lsp t
        doom-modeline-mu4e t
        mu4e-alert-enable-mode-line-display t))

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
