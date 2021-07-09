with (import <nixpkgs> {} );
let
  yq_3_3 = buildGoModule rec {
    pname = "yq-go";
    version = "3.3.2";
    src = fetchFromGitHub {
      owner = "mikefarah";
      rev = version;
      repo = "yq";
      sha256 = "1rdpjxnq6cs6gwpp4bijp38b657yzjqcdzf98lhhpbpskjz8k8pp";
    };
    vendorSha256 = "1bjy3qr26zndr3dhh9gd33rhm5gy779525qgzjw4a4mla0p2q6kl";
  };
in pkgs.mkShell {
  buildInputs = [
    yq_3_3
    pkgs.awscli
    pkgs.credhub
  ];
}
