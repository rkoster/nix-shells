{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.bosh
    pkgs.bosh-bootloader
    pkgs.credhub
    pkgs.fly72
  ];
}
