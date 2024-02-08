{
  description = "A devShell example";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { 
          inherit system; 
        };
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
          ];

          buildInputs = with pkgs; [
            python3
            jupyter

            python3Packages.opencv4
            python3Packages.exif
            python3Packages.ipykernel
            python3Packages.ipython
            python3Packages.jupyter-core
            python3Packages.jupyterlab
            python3Packages.matplotlib
            python3Packages.numpy
            python3Packages.pillow
            python3Packages.tqdm

            poetry
            opencv
            pkg-config
            gtk2
            gtk2-x11
            glib
          ];
        };
      }
    );
}