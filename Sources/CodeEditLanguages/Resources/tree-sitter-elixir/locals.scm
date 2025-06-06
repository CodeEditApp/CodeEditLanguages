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


; References
(identifier) @local.reference

(alias) @local.reference

; Module Definitions
(call
  target: ((identifier) @_identifier
    (#eq? @_identifier "defmodule"))
  (arguments
    (alias) @local.definition.type))

; Pattern Match Definitions
(binary_operator
  ; format-ignore
  left: 
    [
      (identifier) @local.definition.var
      (_ (identifier) @local.definition.var)
      (_ (_ (identifier) @local.definition.var))
      (_ (_ (_ (identifier) @local.definition.var)))
      (_ (_ (_ (_ (identifier) @local.definition.var))))
      (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))
      (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))
      (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))))))
      (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))))))
    ]
  operator: "=")

; Stab Clause Definitions
; format-ignore
(stab_clause
  left:
    [
     (arguments
      [
        (identifier) @local.definition.var
        (_ (identifier) @local.definition.var)
        (_ (_ (identifier) @local.definition.var))
        (_ (_ (_ (identifier) @local.definition.var)))
        (_ (_ (_ (_ (identifier) @local.definition.var))))
        (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))
        (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))
        (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))))))
        (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))))))
      ])

    (binary_operator
      left:
        (arguments
          ; format-ignore
          [
            (identifier) @local.definition.var
            (_ (identifier) @local.definition.var)
            (_ (_ (identifier) @local.definition.var))
            (_ (_ (_ (identifier) @local.definition.var)))
            (_ (_ (_ (_ (identifier) @local.definition.var))))
            (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))
            (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))
            (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var)))))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.var))))))))))))))))))))
          ])
      operator: "when")
    ])

; Aliases
; format-ignore
(call
  target:
    ((identifier) @_identifier
      (#any-of? @_identifier "require" "alias" "use" "import"))
  (arguments
    [
      (alias) @local.definition.import
      (_ (alias) @local.definition.import)
      (_ (_ (alias) @local.definition.import))
      (_ (_ (_ (alias) @local.definition.import)))
      (_ (_ (_ (_ (alias) @local.definition.import))))
    ]))

; Local Function Definitions & Scopes
; format-ignore
(call
  target:
    ((identifier) @_identifier
      (#any-of? @_identifier "def" "defp" "defmacro" "defmacrop" "defguard" "defguardp" "defn" "defnp" "for"))
  (arguments
    [
      (identifier) @local.definition.function
      (binary_operator
        left: (identifier) @local.definition.function
        operator: "when")
      (binary_operator
        (identifier) @local.definition.parameter)
      (call
        target: (identifier) @local.definition.function
        (arguments
          [
            (identifier) @local.definition.parameter
            (_ (identifier) @local.definition.parameter)
            (_ (_ (identifier) @local.definition.parameter))
            (_ (_ (_ (identifier) @local.definition.parameter)))
            (_ (_ (_ (_ (identifier) @local.definition.parameter))))
            (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))
            (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))
            (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))))))))
            (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))))))))
          ]))
    ]?)
  (#set! definition.function.scope parent)(do_block)?) @local.scope

; ExUnit Test Definitions & Scopes
; format-ignore
(call
  target:
    ((identifier) @_identifier
      (#eq? @_identifier "test"))
  (arguments
    [
      (string)
      ((string)
        .
        ","
        .
        [
          (identifier) @local.definition.parameter
          (_ (identifier) @local.definition.parameter)
          (_ (_ (identifier) @local.definition.parameter))
          (_ (_ (_ (identifier) @local.definition.parameter)))
          (_ (_ (_ (_ (identifier) @local.definition.parameter))))
          (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))
          (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))
          (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter)))))))))))))))))))
          (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (_ (identifier) @local.definition.parameter))))))))))))))))))))
        ])
    ])
  (do_block)?) @local.scope

; Stab Clause Scopes
(stab_clause) @local.scope
