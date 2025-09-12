<div align=center>

# ❄️ nix-template-dioxus 🦀

[![NixOS](https://img.shields.io/badge/Made_for-Rust-orange.svg?logo=rust&style=for-the-badge)](https://www.rust-lang.org/) [![NixOS](https://img.shields.io/badge/Flakes-Nix-informational.svg?logo=nixos&style=for-the-badge)](https://nixos.org) ![License](https://img.shields.io/github/license/mordragt/nix-templates?style=for-the-badge)

Minimal **Dioxus** development template for **Nix**

</div>

## About

This is a minimal template for Dioxus development on the nightly channel of Rust.

## Initialization

See the parent README for further instructions, but you can initialize this template
with the following command in your current directory.

```bash
nix flake init -t github:MordragT/nix-templates#dioxus
```

## Usage

- `nix develop`: opens up a `bash` shell with the bare minimum Rust toolset (`cargo` & `rustc`) and Dioxus CLI
- `nix build` : builds the project. Outputs the binary to `./result/bin/<name>`
- `nix run`: runs the program.


## Reference

1. [wiki/Flakes](https://nixos.wiki/wiki/Flakes)
2. [Fenix](https://github.com/nix-community/fenix) - used for managing Rust toolchains (read the `makeRustPlatform` example)
3. [rust-section of language frameworks](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#cargo-features-cargo-features) - optional (use it for extending the template)
