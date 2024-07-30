(require 'use-package)

(use-package emacs
  :custom
  (user-full-name "Jakub Ječmínek")
  (user-mail-address "kuba@kubajecminek.cz")
  (mail-user-agent 'gnus-user-agent)
  (fill-column 78)
  (line-number-mode t)
  (scroll-bar-mode nil)
  (tool-bar-mode nil)
  (menu-bar-mode nil)
  (display-battery-mode 1)
  (display-time-mode 1)
  (visible-bell t)
  (undo-limit 800000)
  (mac-command-modifier 'meta)
  (mac-option-modifier nil)
  (backup-directory-alist
   `(("."
      .
      ,(expand-file-name
        (concat user-emacs-directory ".backups")))))
  (inhibit-startup-screen t)
  (column-number-mode t)

  :custom-face
  (cursor ((t (:background "hotpink"))))

  :init
  (setq disabled-command-function nil)

  :preface
  (when (and (window-system)
             (find-font (font-spec :name "JetBrainsMono")))
    (set-face-attribute 'default nil :font "JetBrainsMono-10")
    (set-frame-font "JetBrainsMono-10" nil t))
  (setq user-emacs-directory "~/.emacs.d/"))

(use-package epg-config
  :custom
  (epg-pinentry-mode 'loopback))

(use-package auth-source
  :preface
  (setq auth-sources
        `(,(expand-file-name ".authinfo.gpg" user-emacs-directory))))
