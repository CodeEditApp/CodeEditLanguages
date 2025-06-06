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


; References
(identifier) @local.reference

; Variables
(assignment
  (identifier) @local.definition.var)

(assignment
  (tuple_expression
    (identifier) @local.definition.var))

; let/const bindings
(let_binding
  (identifier) @local.definition.var)

(let_binding
  (tuple_expression
    (identifier) @local.definition.var))

; For bindings
(for_binding
  (identifier) @local.definition.var)

(for_binding
  (tuple_expression
    (identifier) @local.definition.var))

; Types
(module_definition
  (identifier) @local.definition.type)

(struct_definition
  (identifier) @local.definition.type)

(type_head
  (identifier) @local.definition.type)

(type_head
  (binary_expression
    .
    (identifier) @local.definition.type))

; Module imports
(import_statement
  (identifier) @local.definition.import)

(using_statement
  (identifier) @local.definition.import)

(selected_import
  (identifier) @local.definition.import)

; Scopes
(function_definition
  (signature
    (call_expression
      .
      (identifier) @local.definition.function))) @local.scope

(macro_definition
  (signature
    (call_expression
      .
      (identifier) @local.definition.function))) @local.scope

[
  (quote_statement)
  (let_statement)
  (for_statement)
  (while_statement)
  (try_statement)
  (catch_clause)
  (finally_clause)
  (do_clause)
] @local.scope
