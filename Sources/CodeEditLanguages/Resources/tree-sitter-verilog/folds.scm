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
  (seq_block)
  (function_body_declaration)
  (task_body_declaration)
  (generate_block)
  (always_construct)
  (property_declaration)
  (checker_declaration)
  (class_declaration)
  (config_declaration)
  (covergroup_declaration)
  (clocking_declaration)
  (interface_declaration)
  (module_declaration)
  (package_declaration)
  (module_instantiation)
  (program_declaration)
  (specify_block)
  (generate_region)
  (package_import_declaration)
  (text_macro_definition)
  (include_compiler_directive)+
] @fold
