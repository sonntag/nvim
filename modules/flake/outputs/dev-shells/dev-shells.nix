{
  perSystem = {
    config,
    inputs',
    pkgs,
    self',
    ...
  }: {
    devShells = let
      packages =
        [
          pkgs.npins
          pkgs.lua-language-server
          config.pre-commit.settings.package
        ]
        ++ config.pre-commit.settings.enabledPackages
        ++ (builtins.attrValues config.treefmt.build.programs);
    in {
      default = self'.devShells.stable;

      stable = pkgs.mkShell {
        packages = packages ++ [self'.packages.stable.devMode];
        shellHook =
          config.pre-commit.installationScript
          + ''
            ln -fs ${
              pkgs.mk-luarc-json {
                lua-version = "jit51";
                plugins = config.sonntag.optPlugins ++ config.sonntag.startPlugins;
              }
            } .luarc.json
          '';
      };

      nightly = pkgs.mkShell {
        packages = packages ++ [self'.packages.nightly.devMode];
        shellHook =
          config.pre-commit.installationScript
          + ''
            ln -fs ${
              pkgs.mk-luarc-json {
                lua-version = "jit51";
                nvim = inputs'.neovim-nightly-overlay.packages.neovim;
                plugins = config.sonntag.optPlugins ++ config.sonntag.startPlugins;
              }
            } .luarc.json
          '';
      };
    };
  };
}
