(require 'use-package)

(use-package org-capture
  :after org
  :custom
  (org-capture-templates
   `(("g" "Add Gnus Task" entry
      (file+headline ,my-master-todo-file "Inbox")
      "* TODO %?, Link: %a")))

  :preface
  (setq my-master-todo-file (expand-file-name "TODO.org" "~")))
