(defsystem "lem-lisp-mode"
  :depends-on ("alexandria"
               "trivial-types"
               "usocket"
               "swank"
               "trivia"
               "uiop"
               "lem-lisp-syntax"
               "lem"
               "lem-process"
               "lem-socket-utils")
  :serial t
  :components ((:file "errors")
               (:file "swank-protocol")
               (:file "connections")
               (:file "package")
               (:file "lisp-ui-mode")
               (:file "grammer")
               (:file "message")
               (:file "file-conversion")
               (:file "lisp-mode")
               (:file "repl")
               (:file "sldb")
               (:file "inspector")
               (:file "apropos-mode")
               (:file "autodoc")
               (:file "paren-coloring")
               (:file "misc-commands")
               (:file "package-inferred-system")
               (:file "organize-imports")))

(defsystem "lem-lisp-mode/v2"
  :depends-on ("lem-lisp-mode")
  :serial t
  :pathname "v2"
  :components ((:file "eval")
               (:file "lsp-config")))
