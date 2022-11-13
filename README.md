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

![Github Tests](https://img.shields.io/github/workflow/status/CodeEditApp/CodeEditLanguages/tests/main?label=tests&style=flat-square)
![Documentation](https://img.shields.io/github/workflow/status/CodeEditApp/CodeEditLanguages/build-documentation/main?label=docs&style=flat-square)
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

## Related Repositories

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEdit">
        <img src="https://user-images.githubusercontent.com/806104/163099605-4eaedd33-8441-4125-9ca1-a7ccb2f62a74.png" height="128">
        <p>CodeEdit</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditTextView">
        <img src="https://user-images.githubusercontent.com/806104/175655252-d77cef62-31f5-4f40-a2ad-c1406a6dd1b9.png" height="128">
        <p>CodeEditTextView</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditKit">
        <img src="https://user-images.githubusercontent.com/806104/193877051-c60d255d-0b6a-408c-bb21-6fabc5e0e60c.png" height="128">
        <p>CodeEditKit</p>
      </a>
    </td>
  </tr>
</table>
