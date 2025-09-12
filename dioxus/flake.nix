{
  description = "Dioxus development template using fenix";

  inputs = {
    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    utils,
    fenix,
    ...
  }:
    utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [fenix.overlays.default];
        };
        toolchain = with pkgs.fenix;
          combine [
            complete
            targets."wasm32-unknown-unknown".latest.rust-std
          ];
      in rec
      {
        # Executed by `nix build`
        packages.default =
          (pkgs.makeRustPlatform {
            # Use nightly rustc and cargo provided by fenix for building
            inherit (toolchain) cargo rustc;
          })
          .buildRustPackage {
            pname = "template";
            version = "0.1.0";
            src = ./.;
            cargoLock.lockFile = ./Cargo.lock;

            buildInputs = with pkgs; [
              webkitgtk_4_1
            ];

            # For other makeRustPlatform features see:
            # https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#cargo-features-cargo-features
          };

        # Executed by `nix run`
        apps.default = utils.lib.mkApp {drv = packages.default;};

        # Used by `nix develop`
        devShells.default = pkgs.mkShell {
          # Use nightly cargo & rustc provided by fenix. Add for packages for the dev shell here
          buildInputs = with pkgs; [
            (with toolchain; [
              cargo
              rustc
              clippy
              rustfmt
            ])
            pkg-config
            openssl
            webkitgtk_4_1
            gtk3
            xdotool
            dioxus-cli
          ];
        };
      }
    );
}
