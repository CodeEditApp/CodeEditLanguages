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


; Inject markdown in docstrings
((string_literal
  (content) @injection.content)
  .
  [
    (module_definition)
    (abstract_definition)
    (struct_definition)
    (function_definition)
    (macro_definition)
    (assignment)
    (const_statement)
    (call_expression)
    (identifier)
  ]
  (#set! injection.language "markdown"))

; Inject comments
([
  (line_comment)
  (block_comment)
] @injection.content
  (#set! injection.language "comment"))

; Inject regex in r"..." and r"""...""" (e.g. r"hello\bworld")
(prefixed_string_literal
  prefix: (identifier) @_prefix
  (content) @injection.content
  (#eq? @_prefix "r")
  (#set! injection.language "regex"))

; Inject markdown in md"..." and md"""...""" (e.g. md"**Bold** and _Italics_")
(prefixed_string_literal
  prefix: (identifier) @_prefix
  (content) @injection.content
  (#eq? @_prefix "md")
  (#set! injection.language "markdown"))

; Inject bash in `...` and ```...``` (e.g. `git add --help`)
(command_literal
  (content) @injection.content
  (#set! injection.language "bash"))
