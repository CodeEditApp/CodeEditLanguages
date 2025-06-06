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

; Parameters
(variadic_parameter_declaration
  declarator: (variadic_declarator
    (identifier) @local.definition.parameter))

(optional_parameter_declaration
  declarator: (identifier) @local.definition.parameter)

; Class / struct definitions
(class_specifier) @local.scope

(reference_declarator
  (identifier) @local.definition.var)

(variadic_declarator
  (identifier) @local.definition.var)

(struct_specifier
  name: (qualified_identifier
    name: (type_identifier) @local.definition.type))

(class_specifier
  name: (type_identifier) @local.definition.type)

(concept_definition
  name: (identifier) @local.definition.type)

(class_specifier
  name: (qualified_identifier
    name: (type_identifier) @local.definition.type))

(alias_declaration
  name: (type_identifier) @local.definition.type)

;template <typename T>
(type_parameter_declaration
  (type_identifier) @local.definition.type)

(template_declaration) @local.scope

; Namespaces
(namespace_definition
  name: (namespace_identifier) @local.definition.namespace
  body: (_) @local.scope)

(namespace_definition
  name: (nested_namespace_specifier) @local.definition.namespace
  body: (_) @local.scope)

((namespace_identifier) @local.reference
  (#set! reference.kind "namespace"))

; Function definitions
(template_function
  name: (identifier) @local.definition.function) @local.scope

(template_method
  name: (field_identifier) @local.definition.method) @local.scope

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @local.definition.function)) @local.scope

(field_declaration
  declarator: (function_declarator
    (field_identifier) @local.definition.method))

(lambda_expression) @local.scope

; Control structures
(try_statement
  body: (_) @local.scope)

(catch_clause) @local.scope

(requires_expression) @local.scope
