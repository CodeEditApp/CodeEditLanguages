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


; an injections.scm file for nvim-treesitter
((comment) @injection.content
  (#set! injection.language "comment"))

((pod) @injection.content
  (#set! injection.language "pod"))

((substitution_regexp
  (replacement) @injection.content
  (substitution_regexp_modifiers) @_modifiers)
  ; match if there's a single `e` in the modifiers list
  (#lua-match? @_modifiers "e")
  (#not-lua-match? @_modifiers "e.*e")
  (#set! injection.language "perl")
  (#set! injection.include-children))
