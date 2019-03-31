;;
;; publish.lisp
;;
;; Publishes the org source for my blog into HTML.
;;
;; Modified from https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
;;

;;
;; Pacakage loading
;;
(require 'ox-publish)

;; htmlize is needed for code-block formatting
(load-file "./submodules/htmlize/htmlize.el")
(require 'htmlize)
(setq org-html-htmlize-output-type 'css)

;;
;; Some project definitions
;;
(setq
   sourcedir "./"
   pubdir    "../bgutter.github.io")

;;
;; Define the publishing process
;;
(setq org-publish-project-alist
      `(

        ;; org->HTML
        ("org-notes"
         :base-directory ,sourcedir
         :base-extension "org"
         :publishing-directory ,pubdir
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)

        ;; resource copying
        ("org-static"
         :base-directory ,sourcedir
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg"
         :publishing-directory ,pubdir
         :recursive t
         :publishing-function org-publish-attachment)

        ;; final publish command
        ("blog" :components ("org-notes" "org-static"))))

;;
;; Publish the site
;;
(org-publish-project "blog")
