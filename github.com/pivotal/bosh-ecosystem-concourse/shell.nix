{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.google-cloud-sdk
    pkgs.bosh
    pkgs.credhub
    pkgs.terraform_0_13
    pkgs.fly72
  ];
}
