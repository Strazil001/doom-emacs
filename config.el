  ;;; -*- lexical-binding: t -*-
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 14)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq display-line-numbers-type `relative)

(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato)

(setq org-directory "~/org/"
      org-hide-emphasis-markers t)
(custom-theme-set-faces!
  'catppuccin
  '(org-level-4 :inherit outline-4 :height 1.1 :foreground "#a6da95")
  '(org-level-3 :inherit outline-3 :height 1.15 :weight medium :foreground "#ee99a0")
  '(org-level-2 :inherit outline-2 :height 1.2 :weight semi-bold :foreground "#c6a0f6")
  '(org-level-1 :inherit outline-1 :height 1.35 :weight bold :foreground "#ed8796")
  '(org-document-title :height 1.5 :foreground "#8aadf4" :underline t))
