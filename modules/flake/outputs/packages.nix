{inputs, ...}: {
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    ...
  }: let
    # Build Luna grammar as a plugin with parser and queries
    tree-sitter-luna-plugin = pkgs.stdenv.mkDerivation {
      pname = "tree-sitter-luna-plugin";
      version = "0.1.0";
      src = inputs.tree-sitter-luna;
      nativeBuildInputs = [pkgs.nodejs pkgs.tree-sitter];
      buildPhase = ''
        runHook preBuild
        tree-sitter generate
        $CC -shared -fPIC -o luna.so src/parser.c -I src
        runHook postBuild
      '';
      installPhase = ''
        runHook preInstall
        mkdir -p $out/parser $out/queries
        cp luna.so $out/parser/luna.so
        cp -r queries/luna $out/queries/
        runHook postInstall
      '';
    };
  in {
    sonntag = {
      startPlugins = with pkgs.vimPlugins; [
        lz-n
        tree-sitter-luna-plugin
      ];

      optPlugins = with pkgs.vimPlugins;
        [
          blink-cmp
          # inputs.fff-nvim.packages.${system}.fff-nvim
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
          prettierd
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
