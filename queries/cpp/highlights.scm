;; extends

((identifier) @variable.builtin
  (#eq? @variable.builtin "cin"))
((identifier) @variable.builtin
  (#eq? @variable.builtin "cout"))
((identifier) @variable.builtin
  (#eq? @variable.builtin "cerr"))

; Modules
(module_name
  (identifier) @module)

[
 "module"
] @keyword

[
 "import"
 "export"
] @keyword.import
