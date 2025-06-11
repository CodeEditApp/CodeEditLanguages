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
  (compound_statement)
  (field_declaration_list)
  (case_statement)
  (enumerator_list)
  (compound_literal_expression)
  (initializer_list)
  (init_declarator)
] @indent.begin

; With current indent logic, if we capture expression_statement with @indent.begin
; It will be affected by _parent_ node with error subnodes deep down the tree
; So narrow indent capture to check for error inside expression statement only,
(expression_statement
  (_) @indent.begin
  ";" @indent.end)

(ERROR
  "for"
  "(" @indent.begin
  ";"
  ";"
  ")" @indent.end)

((for_statement
  body: (_) @_body) @indent.begin
  (#not-kind-eq? @_body "compound_statement"))

(while_statement
  condition: (_) @indent.begin)

((while_statement
  body: (_) @_body) @indent.begin
  (#not-kind-eq? @_body "compound_statement"))

((if_statement)
  .
  (ERROR
    "else" @indent.begin))

(if_statement
  condition: (_) @indent.begin)

; Supports if without braces (but not both if-else without braces)
(if_statement
  consequence: (_
    ";" @indent.end) @_consequence
  (#not-kind-eq? @_consequence "compound_statement")
  alternative: (else_clause
    "else" @indent.branch
    [
      (if_statement
        (compound_statement) @indent.dedent)? @indent.dedent
      (compound_statement)? @indent.dedent
      (_)? @indent.dedent
    ])?) @indent.begin

(else_clause
  (_
    .
    "{" @indent.branch))

(compound_statement
  "}" @indent.end)

[
  ")"
  "}"
  (statement_identifier)
] @indent.branch

[
  "#define"
  "#ifdef"
  "#ifndef"
  "#elif"
  "#if"
  "#else"
  "#endif"
] @indent.zero

[
  (preproc_arg)
  (string_literal)
] @indent.ignore

((ERROR
  (parameter_declaration)) @indent.align
  (#set! indent.open_delimiter "(")
  (#set! indent.close_delimiter ")"))

([
  (argument_list)
  (parameter_list)
] @indent.align
  (#set! indent.open_delimiter "(")
  (#set! indent.close_delimiter ")"))

(comment) @indent.auto
