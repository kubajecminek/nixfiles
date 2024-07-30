(require 'package)
(require 'use-package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package magit
  :ensure t)

(use-package lispy
  :ensure t)

(use-package evil
  :ensure t)

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi t))

(use-package notmuch
  :load-path "/usr/share/emacs/site-lisp/elpa-src/notmuch-0.35/")

(use-package klid-mode
  :load-path "~/.emacs.d/elpa/klid/")
