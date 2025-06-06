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


((preproc_arg) @injection.content
  (#set! injection.language "c"))

((comment) @injection.content
  (#set! injection.language "comment"))

((comment) @injection.content
  (#match? @injection.content "/\\*!([a-zA-Z]+:)?re2c")
  (#set! injection.language "re2c"))

((comment) @injection.content
  (#lua-match? @injection.content "/[*\/][!*\/]<?[^a-zA-Z]")
  (#set! injection.language "doxygen"))

((call_expression
  function: (identifier) @_function
  arguments: (argument_list
    .
    [
      (string_literal
        (string_content) @injection.content)
      (concatenated_string
        (string_literal
          (string_content) @injection.content))
    ]))
  ; format-ignore
  (#any-of? @_function 
    "printf" "printf_s"
    "vprintf" "vprintf_s"
    "scanf" "scanf_s"
    "vscanf" "vscanf_s"
    "wprintf" "wprintf_s"
    "vwprintf" "vwprintf_s"
    "wscanf" "wscanf_s"
    "vwscanf" "vwscanf_s"
    "cscanf" "_cscanf"
    "printw"
    "scanw")
  (#set! injection.language "printf"))

((call_expression
  function: (identifier) @_function
  arguments: (argument_list
    (_)
    .
    [
      (string_literal
        (string_content) @injection.content)
      (concatenated_string
        (string_literal
          (string_content) @injection.content))
    ]))
  ; format-ignore
  (#any-of? @_function 
    "fprintf" "fprintf_s"
    "sprintf"
    "dprintf"
    "fscanf" "fscanf_s"
    "sscanf" "sscanf_s"
    "vsscanf" "vsscanf_s"
    "vfprintf" "vfprintf_s"
    "vsprintf"
    "vdprintf"
    "fwprintf" "fwprintf_s"
    "vfwprintf" "vfwprintf_s"
    "fwscanf" "fwscanf_s"
    "swscanf" "swscanf_s"
    "vswscanf" "vswscanf_s"
    "vfscanf" "vfscanf_s"
    "vfwscanf" "vfwscanf_s"
    "wprintw"
    "vw_printw" "vwprintw"
    "wscanw"
    "vw_scanw" "vwscanw")
  (#set! injection.language "printf"))

((call_expression
  function: (identifier) @_function
  arguments: (argument_list
    (_)
    .
    (_)
    .
    [
      (string_literal
        (string_content) @injection.content)
      (concatenated_string
        (string_literal
          (string_content) @injection.content))
    ]))
  ; format-ignore
  (#any-of? @_function 
    "sprintf_s"
    "snprintf" "snprintf_s"
    "vsprintf_s"
    "vsnprintf" "vsnprintf_s"
    "swprintf" "swprintf_s"
    "snwprintf_s"
    "vswprintf" "vswprintf_s"
    "vsnwprintf_s"
    "mvprintw"
    "mvscanw")
  (#set! injection.language "printf"))

((call_expression
  function: (identifier) @_function
  arguments: (argument_list
    (_)
    .
    (_)
    .
    (_)
    .
    [
      (string_literal
        (string_content) @injection.content)
      (concatenated_string
        (string_literal
          (string_content) @injection.content))
    ]))
  (#any-of? @_function "mvwprintw" "mvwscanw")
  (#set! injection.language "printf"))

; TODO: add when asm is added
; (gnu_asm_expression assembly_code: (string_literal) @injection.content
; (#set! injection.language "asm"))
; (gnu_asm_expression assembly_code: (concatenated_string (string_literal) @injection.content)
; (#set! injection.language "asm"))
