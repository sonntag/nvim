{inputs, ...}: {
  perSystem = {system, ...}: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.gen-luarc.overlays.default
        inputs.nvim-treesitter-main.overlays.default
      ];
      config.allowUnfree = true;
    };
  };
}
