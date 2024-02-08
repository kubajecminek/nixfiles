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
             (find-font (font-spec :name "JetBrainsMono Nerd Font")))
    (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-10")
    (set-frame-font "JetBrainsMono Nerd Font-10" nil t))
  (setq user-emacs-directory "~/.emacs.d/"))

(use-package epg-config
  :custom
  (epg-pinentry-mode 'loopback))

(use-package auth-source-pass
  :preface
  (setq auth-sources
        `(password-store
          ,(expand-file-name ".authinfo.gpg" user-emacs-directory)))

  :config
  (auth-source-pass-enable))

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
  (gnus-verbose 10) ;; I prefer chatty gnus
  (gnus-search-use-parsed-queries t)
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
                                                (nnimap-record-commands t))
                                        (nntp "news.gmane.io"))))

(use-package gnus-sum
  :bind (:map gnus-summary-mode-map
              ("F" . gnus-summary-very-wide-reply-with-original))
  :hook
  (gnus-summary-mode . hl-line-mode)
  :custom
  (gnus-user-date-format-alist '(((gnus-seconds-today) . "Today      %H:%M")
                                 ((+ 86400 (gnus-seconds-today)) . "Yesterday  %H:%M")
                                 (t . "%d.%m.%Y %H:%M")))
  (gnus-summary-line-format "%U %4i %&user-date; %3t: %-23,23f %s %B\n")
  (gnus-sort-gathered-threads-function #'gnus-thread-sort-by-date)
  (gnus-thread-sort-functions '(gnus-thread-sort-by-date))
  (gnus-article-sort-function '(gnus-article-sort-by-date))
  (gnus-summary-prepared-hook '(gnus-summary-hide-all-threads))
  (gnus-thread-hide-subtree t)

  :config
  (remove-hook 'gnus-summary-prepare-exit-hook 'gnus-summary-expire-articles)
  (when (window-system)
    (setq gnus-sum-thread-tree-indent "  "
          gnus-sum-thread-tree-root "● "
          gnus-sum-thread-tree-false-root "◯ "
          gnus-sum-thread-tree-single-indent "◎ "
          gnus-sum-thread-tree-vertical        "│"
          gnus-sum-thread-tree-leaf-with-other "├─► "
          gnus-sum-thread-tree-single-leaf     "╰─► ")))

(use-package gnus-group
  :after gnus
  :hook
  (gnus-group-mode . hl-line-mode))

(use-package message
  :bind ("C-x m" . compose-mail)
  :custom
  (message-directory (expand-file-name "Mail/" gnus-home-directory))
  (message-send-mail-function 'smtpmail-send-it)
  (message-generate-headers-first t))

(use-package smtpmail
  :custom
  (smtpmail-smtp-server "127.0.0.1")
  (smtpmail-smtp-user user-mail-address)
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
