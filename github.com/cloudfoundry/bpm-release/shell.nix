{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.go_1_15
    pkgs.ginkgo
    pkgs.fly67
  ];
}
