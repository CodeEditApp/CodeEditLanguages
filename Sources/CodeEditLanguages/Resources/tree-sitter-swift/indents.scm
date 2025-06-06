; Copyright 2025 nvim-treesitter
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.


; format-ignore
[
  ; ... refers to the section that will get affected by this indent.begin capture
  (protocol_body)               ; protocol Foo { ... }
  (class_body)                  ; class Foo { ... }
  (enum_class_body)             ; enum Foo { ... }
  (function_declaration)        ; func Foo (...) {...}
  (init_declaration)            ; init(...) {...}
  (deinit_declaration)          ; deinit {...}
  (computed_property)           ; { ... }
  (subscript_declaration)       ; subscript Foo(...) { ... }

  (computed_getter)             ; get { ... }
  (computed_setter)             ; set { ... }

  (assignment)                  ; a = b

  (control_transfer_statement)  ; return ...
  (for_statement)
  (while_statement)
  (repeat_while_statement)
  (do_statement)
  (if_statement)
  (switch_statement)
  (guard_statement)

  (type_parameters)             ; x<Foo>
  (tuple_type)                  ; (...)
  (array_type)                  ; [String]
  (dictionary_type)             ; [Foo: Bar]

  (call_expression)             ; callFunc(...)
  (tuple_expression)            ; ( foo + bar )
  (array_literal)               ; [ foo, bar ]
  (dictionary_literal)          ; [ foo: bar, x: y ]
  (lambda_literal) 
  (willset_didset_block)
  (willset_clause)
  (didset_clause)
] @indent.begin

(init_declaration) @indent.begin

(init_declaration
  [
    "init"
    "("
  ] @indent.branch)

; indentation for init parameters
(init_declaration
  ")" @indent.branch @indent.end)

(init_declaration
  (parameter) @indent.begin
  (#set! indent.immediate))

; @something(...)
(modifiers
  (attribute) @indent.begin)

(function_declaration
  (modifiers
    .
    (attribute)
    (_)* @indent.branch)
  .
  _ @indent.branch
  (#not-kind-eq? @indent.branch "type_parameters" "parameter"))

(ERROR
  [
    "<"
    "{"
    "("
    "["
  ]) @indent.begin

; if-elseif
(if_statement
  (if_statement) @indent.dedent)

; case Foo:
; default Foo:
; @attribute default Foo:
(switch_entry
  .
  _ @indent.branch)

(function_declaration
  ")" @indent.branch)

(type_parameters
  ">" @indent.branch @indent.end .)

(tuple_expression
  ")" @indent.branch @indent.end)

(value_arguments
  ")" @indent.branch @indent.end)

(tuple_type
  ")" @indent.branch @indent.end)

(modifiers
  (attribute
    ")" @indent.branch @indent.end))

[
  "}"
  "]"
] @indent.branch @indent.end

[
  ; (ERROR)
  (comment)
  (multiline_comment)
  (raw_str_part)
  (multi_line_string_literal)
] @indent.auto

(directive) @indent.ignore
