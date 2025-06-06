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


; Definitions
(variable_declarator
  .
  (identifier) @local.definition.var)

(variable_declarator
  (tuple_pattern
    (identifier) @local.definition.var))

(declaration_expression
  name: (identifier) @local.definition.var)

(foreach_statement
  left: (identifier) @local.definition.var)

(foreach_statement
  left: (tuple_pattern
    (identifier) @local.definition.var))

(parameter
  (identifier) @local.definition.parameter)

(method_declaration
  name: (identifier) @local.definition.method)

(local_function_statement
  name: (identifier) @local.definition.method)

(property_declaration
  name: (identifier) @local.definition)

(type_parameter
  (identifier) @local.definition.type)

(class_declaration
  name: (identifier) @local.definition)

; References
(identifier) @local.reference

; Scope
(block) @local.scope
