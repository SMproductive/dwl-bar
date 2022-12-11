(define-module (nordic-channel packages wm)
  #:use-module (nordic-channel packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages base)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))
(package
 (name "dwl-bar")
 (version "0")
 (source (origin
          (method git-fetch)
          (uri (git-reference
                (url "https://github.com/SMproductive/dwl-bar.git")
                (commit "09b51726d0423a246e39480eceb0d55d307ad801")))
          (file-name (git-file-name name version))
          (sha256
           (base32 "051x19nzsrv59pghxmx6xa1yms6s4fs7xcfvkq0fr5vjqdnpk15k"))))
 (build-system glib-or-gtk-build-system)
 (arguments
  `(#:tests? #f                      ; no tests
    #:make-flags
    (list
     (string-append "CC=" ,(cc-for-target))
     (string-append "PREFIX=" (assoc-ref %outputs "out")))
    #:phases
    (modify-phases %standard-phases
                   (delete 'configure))))
 (native-inputs
  (list pkg-config))
 (propagated-inputs
  (list gtk))
 (home-page "https://github.com/SMproductive/nordic-dwl")
 (synopsis "Bar for dwl")
 (description "Is like the usual dwm bar made with gtk.")
 (license license:gpl3+))
