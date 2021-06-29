{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gh
    pkgs.jq
    pkgs.microplane
  ];
}
