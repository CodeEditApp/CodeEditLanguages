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
  (protocol_body)               ; protocol Foo { ... }
  (class_body)                  ; class Foo { ... }
  (enum_class_body)             ; enum Foo { ... }
  (function_body)               ; func Foo (...) {...}
  (computed_property)           ; { ... }

  (computed_getter)             ; get { ... }
  (computed_setter)             ; set { ... }

  (do_statement)
  (if_statement)
  (for_statement)
  (switch_statement)
  (while_statement)
  (guard_statement)
  (switch_entry)

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

  (import_declaration)+
] @fold
