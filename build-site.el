(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html)))

;; Generate the site output
(org-publish-all t)
