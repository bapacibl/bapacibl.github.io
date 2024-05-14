;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-creator t
	     :with-toc t
	     :selection-numbers nil
	     :time-stamp-file nil)))

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://perfectmotherfuckingwebsite.com/fuckingstyle.css?v=1c835cd4a7d8881e2bce284d9d1bdaf408751d20\" />")



;; Generate the site output
(org-publish-all t)

(message "Build complete!")
