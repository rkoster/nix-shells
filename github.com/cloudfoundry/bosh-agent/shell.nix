{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.go_1_16
    pkgs.ginkgo
  ];
}
