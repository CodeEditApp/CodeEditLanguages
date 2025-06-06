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
  (let_binding)                 ; let = ...
  (type_binding)

  (external)
  (record_declaration)          ; { foo: bar ... }
  (structure)                   ; struct ... end
  (signature)                   ; sig ... end
  (value_specification)         ; val x: bar

  (do_clause)                   ; do ... done
  (match_case)

  (field_expression)
  (application_expression)
  (parenthesized_expression)    ; ( ... )
  (record_expression)           ; { foo = bar ... }
  (list_expression)             ; [...;...]
  (try_expression)              ; try ... with
] @indent.begin

; handle if-else if-else case
(if_expression
  condition: (_) @indent.begin)

(then_clause) @indent.begin

((else_clause
  (_) @_not_if) @indent.begin
  (#not-kind-eq? @_not_if "if_expression"))

((parameter) @indent.begin
  (#set! indent.start_at_same_line))

(_
  (ERROR) @indent.begin
  (#set! indent.start_at_same_line))

(ERROR
  "|" @indent.begin
  (#set! indent.start_at_same_line))

(try_expression
  "with" @indent.branch
  [
    (match_case) @indent.dedent
    (match_case
      [
        (parenthesized_expression)
        (list_expression)
      ] @indent.dedent)
  ])

"}" @indent.branch @indent.end

(list_expression
  "]" @indent.branch)

(parenthesized_expression
  ")" @indent.branch)

";;" @indent.end

(do_clause
  "done" @indent.end @indent.branch)

(structure
  "end" @indent.end @indent.branch)

(signature
  "end" @indent.end @indent.branch)

[
  (string)
  (comment)
] @indent.auto
