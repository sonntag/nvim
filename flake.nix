{
  description = "Justin's Neovim Config";

  # nixConfig = {
  #   substitutors = [
  #     "https://sonntag.cachix.org"
  #   ];
  #   trusted-public-keys = [
  #     "sonntag.cachix.org-1:4rHXwjmC/EpRwVkCyH0xLQaoeZT9C0oq8TINGSap1Wk="
  #   ];
  # };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-compat.url = "github:edolstra/flake-compat";
    import-tree.url = "github:vic/import-tree";
    mnw.url = "github:Gerg-L/mnw";
    tree-sitter-luna.url = "github:sonntag/tree-sitter-luna";
    nvim-treesitter-main.url = "github:iofq/nvim-treesitter-main";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    gen-luarc = {
      url = "github:mrcjkb/nix-gen-luarc-json";
      inputs = {
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
        nixpkgs.follows = "nixpkgs";
      };
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # fff-nvim = {
    #   url = "github:dmtrKovalenko/fff.nvim";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     flake-utils.follows = "flake-utils";
    #     rust-overlay.follows = "rust-overlay";
    #   };
    # };

    # rust-overlay = {
    #   url = "github:oxalica/rust-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # This is necessary since fff-nvim depends on flake-utils, which depends on systems
    # flake-utils = {
    #   url = "github:numtide/flake-utils";
    #   inputs = {
    #     systems.follows = "systems";
    #   };
    # };
  };
}
