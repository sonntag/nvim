{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem.pre-commit = {
    check.enable = true;
    settings.hooks = {
      actionlint.enable = true;
      selene.enable = true;
      treefmt.enable = true;
    };
  };
}
