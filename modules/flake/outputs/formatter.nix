{inputs, ...}: {
  imports = [inputs.treefmt-nix.flakeModule];

  perSystem.treefmt.programs = {
    alejandra.enable = true;
    deadnix.enable = true;
    prettier.enable = true;
    statix.enable = true;

    stylua = {
      enable = true;
      settings.indent_type = "Spaces";
    };
  };
}
