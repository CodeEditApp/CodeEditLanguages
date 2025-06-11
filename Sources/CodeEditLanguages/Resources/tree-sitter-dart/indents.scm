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
  (class_body)
  (function_body)
  (function_expression_body)
  (declaration
    (initializers))
  (switch_block)
  (formal_parameter_list)
  (formal_parameter)
  (list_literal)
  (return_statement)
  (arguments)
  (try_statement)
] @indent.begin

(switch_block
  (_) @indent.begin
  (#set! indent.immediate 1)
  (#set! indent.start_at_same_line 1))

[
  (switch_statement_case)
  (switch_statement_default)
] @indent.branch

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @indent.branch

"}" @indent.end

(return_statement
  ";" @indent.end)

(break_statement
  ";" @indent.end)

(comment) @indent.ignore

; dedenting the else block is painfully slow; replace with simpler strategy
; (if_statement) @indent.begin
; (if_statement
;   (block) @indent.branch)
(if_statement) @indent.auto
