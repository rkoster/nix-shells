{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    # pkgs.go_1_16
    # pkgs.ginkgo
    pkgs.rubyPackages_2_7.rspec
    pkgs.ruby_2_7
  ];
}
