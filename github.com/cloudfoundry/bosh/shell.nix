{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.go
    pkgs.ruby_3_0
    pkgs.rubyPackages_3_0.rspec
    pkgs.rubyPackages_3_0.sqlite3
    pkgs.rubyPackages_3_0.json
    pkgs.rubyPackages_3_0.byebug
    pkgs.sqlite
    pkgs.libmysqlclient
    pkgs.postgresql
   ];
}
