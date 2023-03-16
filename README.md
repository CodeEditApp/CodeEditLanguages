<p align="center">
  <img src="https://user-images.githubusercontent.com/806104/201497920-d6aace8d-f0dc-49f6-bcd7-6a3b64cc384c.png" height="128" alt="CodeEditLanguages Icon">
  <h1 align="center">CodeEditLanguages</h1>
</p>

<p align="center">
  <a aria-label="Follow CodeEdit on Twitter" href="https://twitter.com/CodeEditApp" target="_blank">
    <img alt="" src="https://img.shields.io/badge/Follow%20@CodeEditApp-black.svg?style=for-the-badge&logo=Twitter">
  </a>
  <a aria-label="Join the community on Discord" href="https://discord.gg/vChUXVf9Em" target="_blank">
    <img alt="" src="https://img.shields.io/badge/Join%20the%20community-black.svg?style=for-the-badge&logo=Discord">
  </a>
  <a aria-label="Read the Documentation" href="https://codeeditapp.github.io/CodeEditLanguages/documentation/codeeditlanguages" target="_blank">
    <img alt="" src="https://img.shields.io/badge/Documentation-black.svg?style=for-the-badge&logo=readthedocs&logoColor=blue">
  </a>
</p>

A collection of `tree-sitter` languages for syntax highlighting.

![Github Tests](https://img.shields.io/github/actions/workflow/status/CodeEditApp/CodeEditLanguages/tests.yml?branch=main&label=tests&style=flat-square)
![Documentation](https://img.shields.io/github/actions/workflow/status/CodeEditApp/CodeEditLanguages/build-documentation.yml?branch=main&label=docs&style=flat-square)
![GitHub Repo stars](https://img.shields.io/github/stars/CodeEditApp/CodeEditLanguages?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/CodeEditApp/CodeEditLanguages?style=flat-square)
[![Discord Badge](https://img.shields.io/discord/951544472238444645?color=5865F2&label=Discord&logo=discord&logoColor=white&style=flat-square)](https://discord.gg/vChUXVf9Em)

## Overview

This package includes a binary framework `CodeLanguagesContainer.xcframework` which bundles all `tree-sitter` languages in a single binary to greatly reduce SPM package resolution times.

The languages are then served as a `CodeLanguage`.

## SwiftTreeSitter

This package heavily depends on [SwiftTreeSitter](https://github.com/ChimeHQ/SwiftTreeSitter) by [Matt Massicotte](https://twitter.com/mattie).

## Documentation

The documentation including a guide on how to add support for new languages can be found **[here](https://codeeditapp.github.io/CodeEditLanguages/documentation/codeeditlanguages)**!

## Supported Languages

There are several [language grammars](https://tree-sitter.github.io/tree-sitter/#available-parsers) available for [tree-sitter](https://tree-sitter.github.io/tree-sitter/). Many of them are already supported in `CodeEditLanguages`. In order to use **syntax-highlighting** with those grammars, they need to supply a `highlights.scm` file. Grammars for which this file does not exist yet, are marked with _`not available`_ below. This file has to be added to the grammar's repo directly.

In order to add support for additional languages we have a complete guide on how to implement them in `CodeEditLanguages` available [here](https://codeeditapp.github.io/CodeEditLanguages/documentation/codeeditlanguages/add-languages/).

> If you want to add support for another language, please file an [issue](https://github.com/CodeEditApp/CodeEditLanguages/issues/new/choose) first, so everyone knows that this is in progress.

| Grammar        | Implemented | Syntax Highlighting |
| -------------- | :---------: | :-----------------: |
| [Agda](https://github.com/tree-sitter/tree-sitter-agda) |  | _not available_ |
| [Bash](https://github.com/lukepistrol/tree-sitter-bash) | ✅ | ✅ |
| [C](https://github.com/tree-sitter/tree-sitter-c) | ✅ | ✅ |
| [C++](https://github.com/tree-sitter/tree-sitter-cpp) | ✅ | ✅ |
| [C#](https://github.com/tree-sitter/tree-sitter-c-sharp) | ✅ | ✅ |
| [CSS](https://github.com/lukepistrol/tree-sitter-css) | ✅ | ✅ |
| [Dockerfile](https://github.com/camdencheek/tree-sitter-dockerfile) | ✅ | ✅ |
| [Elixir](https://github.com/elixir-lang/tree-sitter-elixir) | ✅ | ✅ |
| [ERB, EJS](https://github.com/tree-sitter/tree-sitter-embedded-template) |  |  |
| [Go](https://github.com/tree-sitter/tree-sitter-go) | ✅ | ✅ |
| [Haskell](https://github.com/tree-sitter/tree-sitter-haskell) | ✅ | ✅ |
| [HTML](https://github.com/mattmassicotte/tree-sitter-html) | ✅ | ✅ |
| [Java](https://github.com/tree-sitter/tree-sitter-java) | ✅ | ✅ |
| [JavaScript/JSX](https://github.com/tree-sitter/tree-sitter-javascript) | ✅ | ✅ |
| [JSDoc](https://github.com/tree-sitter/tree-sitter-jsdoc) |  |  |
| [JSON](https://github.com/mattmassicotte/tree-sitter-json) | ✅ | ✅ |
| [Julia](https://github.com/tree-sitter/tree-sitter-julia) |  | _not available_ |
| [Kotlin](https://github.com/lukepistrol/tree-sitter-kotlin/tree/feature/spm-queries) | ✅ | ✅ |
| [Lua](https://github.com/lukepistrol/tree-sitter-lua/tree/feature/spm) | ✅ | ✅ |
| [Markdown](https://github.com/ikatyang/tree-sitter-markdown) |  | _not available_ |
| [Objective C](https://github.com/lukepistrol/tree-sitter-objc/tree/feature/spm) | ✅ | ✅ |
| [OCaml](https://github.com/cengelbart39/tree-sitter-ocaml/tree/feature/spm) | ✅ | ✅ |
| Plain Text | ✅ | _not available_ |
| [Perl](https://github.com/ganezdragon/tree-sitter-perl) |  | _not available_ |
| [PHP](https://github.com/tree-sitter/tree-sitter-php) | ✅ | ✅ |
| [Python](https://github.com/lukepistrol/tree-sitter-python) | ✅ | ✅ |
| [Regex](https://github.com/tree-sitter/tree-sitter-regex) | ✅ | ✅ |
| [Ruby](https://github.com/mattmassicotte/tree-sitter-ruby) | ✅ | ✅ |
| [Rust](https://github.com/tree-sitter/tree-sitter-rust) | ✅ | ✅ |
| [Scala](https://github.com/tree-sitter/tree-sitter-scala) |  |  |
| [Sql](https://github.com/lukepistrol/tree-sitter-sql/tree/feature/spm) | ✅ | ✅ |
| [Swift](https://github.com/alex-pinkus/tree-sitter-swift/tree/with-generated-files) | ✅ | ✅ |
| [TOML](https://github.com/ikatyang/tree-sitter-toml) |  |  |
| [TypeScript/TSX](https://github.com/tree-sitter/tree-sitter-typescript) |  |  |
| [Verilog](https://github.com/tree-sitter/tree-sitter-verilog) |  | _not available_ |
| [YAML](https://github.com/lukepistrol/tree-sitter-yaml/tree/feature/spm) | ✅ | ✅ |
| [Zig](https://github.com/maxxnino/tree-sitter-zig) | ✅ | ✅ |

## Related Repositories

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEdit">
        <img src="https://user-images.githubusercontent.com/806104/163099605-4eaedd33-8441-4125-9ca1-a7ccb2f62a74.png" width="128" height="128">
        <p>CodeEdit</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditTextView">
        <img src="https://user-images.githubusercontent.com/806104/175655252-d77cef62-31f5-4f40-a2ad-c1406a6dd1b9.png" width="128" height="128">
        <p>CodeEditTextView</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditKit">
        <img src="https://user-images.githubusercontent.com/806104/193877051-c60d255d-0b6a-408c-bb21-6fabc5e0e60c.png" width="128" height="128">
        <p>CodeEditKit</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditCLI">
        <img src="https://user-images.githubusercontent.com/806104/205848006-f2654778-21f1-4f97-b292-32849cc1eff6.png" height="128">
        <p>CodeEdit CLI</p>
      </a>
    </td>
  </tr>
</table>
