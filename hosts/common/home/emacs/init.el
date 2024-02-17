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

  :preface
  (setq user-emacs-directory "~/.emacs.d/"))

(use-package pinentry
  :config
  (pinentry-start))

(use-package epg-config
  :custom
  (epg-pinentry-mode 'loopback)

  :preface
  (setenv "GPG_AGENT_INFO" nil))

(use-package gnus-start
  :custom
  (gnus-asynchronous t)
  (gnus-always-read-dribble-file t)
  (gnus-check-new-newsgroups nil)
  (gnus-interactive-exit 'quiet)
  (gnus-large-newsgroup 500)
  (gnus-read-active-file nil)
  (gnus-read-newsrc-file nil)
  (gnus-save-newsrc-file nil)
  (gnus-use-cache t)
  (gnus-novice-user nil)
  (gnus-expert-user t)
  (gnus-user-agent '(emacs gnus))
  (gnus-save-killed-list nil)
  (gnus-fetch-old-headers t)
  (gnus-permanently-visible-groups "INBOX")
  (gnus-posting-styles '((".*"
                          (signature
                           "Kuba Ječmínek (http://kubajecminek.cz)"))))

  :preface
  (setq gnus-home-directory "~/Gnus/"
        gnus-startup-file (expand-file-name ".newsrc" gnus-home-directory))

  :init
  (setq gnus-select-method '(nnnil ""))
  (setq gnus-secondary-select-methods '((nnimap "proton"
                                                (nnimap-address "127.0.0.1")
                                                (nnimap-user "kuba@kubajecminek.cz")
                                                (nnimap-server-port 1143)
                                                (nnimap-expunge never)
                                                (nnimap-stream network)
                                                (nnimap-record-commands t)))))

(use-package message
  :bind ("C-x m" . compose-mail)
  :custom
  (message-directory (expand-file-name "Mail/" gnus-home-directory))
  (message-send-mail-function 'smtpmail-send-it)
  (message-generate-headers-first t))

(use-package smtpmail
  :custom
  (smtpmail-smtp-server "127.0.0.1")
  (smtpmail-smtp-service 1025)
  (smtpmail-stream-type 'starttls)
  (smtpmail-debug-info t)
  (starttls-use-gnutls t))

(use-package org-capture
  :after org
  :custom
  (org-capture-templates
   `(("g" "Add Gnus Task" entry
      (file+headline ,my-master-todo-file "Inbox")
      "* TODO %?, Link: %a")))

  :preface
  (setq my-master-todo-file (expand-file-name "TODO.org" "~")))
