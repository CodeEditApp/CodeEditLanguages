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


; inherits: c

[
  (for_range_loop)
  (class_specifier)
  (field_declaration
    type: (enum_specifier)
    default_value: (initializer_list))
  (template_declaration)
  (namespace_definition)
  (try_statement)
  (catch_clause)
  (lambda_expression)
] @fold
