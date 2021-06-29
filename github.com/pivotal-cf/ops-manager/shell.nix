with (import <nixpkgs> {});
let
  bundler_1_17 = buildRubyGem rec {
    inherit ruby_2_6;
    name = "${gemName}-${version}";
    gemName = "bundler";
    version = "1.17.3";
    source.sha256 = "0ln3gnk7cls81gwsbxvrmlidsfd78s6b2hzlm4d4a9wbaidzfjxw";
    dontPatchShebangs = true;
    postFixup = ''
      sed -i -e "s/activate_bin_path/bin_path/g" $out/bin/bundle
    '';
  };

  ruby_2_6_with_bundler_1_17 = pkgs.ruby_2_6.override { bundler = bundler_1_17; };
  bundix_with_bundler_1_17 = pkgs.bundix.override { bundler = bundler_1_17; };

  gems = pkgs.bundlerEnv {
    name = "ops-manager";
    ruby = ruby_2_6_with_bundler_1_17;
    gemdir = ./web/.;
    gemConfig = defaultGemConfig // {
      ruby-debug-ide = attrs: {
        dontBuild = false;
        postUnpack = ''
          echo "Overriding mkrf_conf.rb"
          echo '\
            # create dummy rakefile to indicate success
            f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")
            f.write("task :default\n")
            f.close
          ' > $sourceRoot/ext/mkrf_conf.rb
        '';
      };
    };
  };
in pkgs.mkShell {
  buildInputs = [
    bundix_with_bundler_1_17
    ruby_2_6_with_bundler_1_17
    gems
  ];
}
