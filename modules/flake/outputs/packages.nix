{inputs, ...}: {
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    system,
    ...
  }: {
    sonntag = {
      startPlugins = with pkgs.vimPlugins; [
        lz-n
      ];

      optPlugins = with pkgs.vimPlugins;
        [
          blink-cmp
          inputs.fff-nvim.packages.${system}.fff-nvim
          nvim-treesitter.withAllGrammars
        ]
        ++ inputs.mnw.lib.npinsToPlugins pkgs ../../../plugins.json;
    };

    packages = let
      commonArgs = {
        appName = "nvim-sonntag";

        extraBinPath = with pkgs; [
          alejandra
          copilot-language-server
          fd
          imagemagick
          mdformat
          marksman
          nixd
          ripgrep
        ];

        extraLuaPackages = ps: [
          ps.magick
        ];

        initLua = builtins.readFile ../../../init.lua;

        plugins = {
          dev.config = {
            pure = ../../../nvim;
            impure = "/' .. vim.uv.cwd()  .. '/nvim";
          };

          start = config.sonntag.startPlugins;
          opt = config.sonntag.optPlugins;
        };
      };
    in {
      default = self'.packages.stable;

      nightly = inputs.mnw.lib.wrap {inherit pkgs;} (
        commonArgs // {inherit (inputs'.neovim-nightly-overlay.packages) neovim;}
      );

      stable = inputs.mnw.lib.wrap {inherit pkgs;} commonArgs;
    };
  };
}
