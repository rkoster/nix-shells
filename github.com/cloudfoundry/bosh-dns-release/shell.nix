{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.go_1_16
    pkgs.ginkgo
    # pkgs.fly72
    # pkgs.fly67
    # pkgs.fly64
    # pkgs.fly60
  ];
}
