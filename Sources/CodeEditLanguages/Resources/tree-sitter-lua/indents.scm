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
  (function_definition)
  (function_declaration)
  (field)
  (do_statement)
  (method_index_expression)
  (while_statement)
  (repeat_statement)
  (if_statement)
  "then"
  (for_statement)
  (return_statement)
  (table_constructor)
  (arguments)
] @indent.begin

[
  "end"
  "}"
  "]]"
] @indent.end

(")" @indent.end
  (#not-has-parent? @indent.end parameters))

(return_statement
  (expression_list
    (function_call))) @indent.dedent

[
  "end"
  "then"
  "until"
  "}"
  ")"
  "elseif"
  (elseif_statement)
  "else"
  (else_statement)
] @indent.branch

(comment) @indent.auto

(string) @indent.auto

(ERROR
  "function") @indent.begin
