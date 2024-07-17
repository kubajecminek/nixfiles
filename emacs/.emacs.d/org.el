(require 'use-package)

(use-package org-capture
  :after org
  :custom
  (org-capture-templates
   `(("g" "Add Gnus Task" entry
      (file+headline ,my-org-master-todo-file "Inbox")
      "* TODO %?, Link: %a")))

  :preface
  (setq my-org-master-dir (expand-file-name "~/Documents/Org"))
  (setq my-org-master-todo-file (expand-file-name "TODO.org" my-org-master-dir))
  (setq my-org-master-calendar-file (expand-file-name "calendar.org" my-org-master-dir)))

(use-package org
  :custom
  (org-agenda-files `(,my-org-master-dir)))
