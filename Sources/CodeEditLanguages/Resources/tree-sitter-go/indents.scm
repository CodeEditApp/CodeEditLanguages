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


[
  (import_declaration)
  (const_declaration)
  (var_declaration)
  (type_declaration)
  (func_literal)
  (literal_value)
  (expression_case)
  (communication_case)
  (type_case)
  (default_case)
  (block)
  (call_expression)
  (parameter_list)
  (field_declaration_list)
  (interface_type)
] @indent.begin

(literal_value
  "}" @indent.branch)

(block
  "}" @indent.branch)

(field_declaration_list
  "}" @indent.branch)

(interface_type
  "}" @indent.branch)

(const_declaration
  ")" @indent.branch)

(import_spec_list
  ")" @indent.branch)

(var_spec_list
  ")" @indent.branch)

[
  "}"
  ")"
] @indent.end

(parameter_list
  ")" @indent.branch)

(comment) @indent.ignore
