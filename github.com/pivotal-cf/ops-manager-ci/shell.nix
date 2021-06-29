{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.fly56
    pkgs.awscli
    pkgs.ruby_2_6
  ];
}
