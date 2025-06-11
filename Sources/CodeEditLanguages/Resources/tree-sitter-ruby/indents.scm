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
  (class)
  (singleton_class)
  (method)
  (singleton_method)
  (module)
  (call)
  (if)
  (block)
  (do_block)
  (hash)
  (array)
  (argument_list)
  (case)
  (while)
  (until)
  (for)
  (begin)
  (unless)
  (assignment)
  (parenthesized_statements)
] @indent.begin

[
  "end"
  ")"
  "}"
  "]"
] @indent.end

[
  "end"
  ")"
  "}"
  "]"
  (when)
  (elsif)
  (else)
  (rescue)
  (ensure)
] @indent.branch

(comment) @indent.ignore
