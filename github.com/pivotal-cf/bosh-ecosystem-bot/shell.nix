{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.cloudfoundry-cli
    pkgs.nodejs-16_x
  ];
}
