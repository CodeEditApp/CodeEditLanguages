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


([
  (line_comment)
  (multiline_comment)
] @injection.content
  (#set! injection.language "comment"))

; There are 3 ways to define a regex
;    - "[abc]?".toRegex()
(call_expression
  (navigation_expression
    ((string_literal) @injection.content
      (#set! injection.language "regex"))
    (navigation_suffix
      ((simple_identifier) @_function
        (#eq? @_function "toRegex")))))

;    - Regex("[abc]?")
(call_expression
  ((simple_identifier) @_function
    (#eq? @_function "Regex"))
  (call_suffix
    (value_arguments
      (value_argument
        (string_literal) @injection.content
        (#set! injection.language "regex")))))

;    - Regex.fromLiteral("[abc]?")
(call_expression
  (navigation_expression
    ((simple_identifier) @_class
      (#eq? @_class "Regex"))
    (navigation_suffix
      ((simple_identifier) @_function
        (#eq? @_function "fromLiteral"))))
  (call_suffix
    (value_arguments
      (value_argument
        (string_literal) @injection.content
        (#set! injection.language "regex")))))

; "pi = %.2f".format(3.14159)
((call_expression
  (navigation_expression
    (string_literal) @injection.content
    (navigation_suffix
      (simple_identifier) @_method)))
  (#eq? @_method "format")
  (#set! injection.language "printf"))
