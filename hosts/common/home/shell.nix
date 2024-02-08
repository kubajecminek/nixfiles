{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  packageNames = map (p: p.pname or p.name or null) config.home.packages;
  hasPackage = name: lib.any (x: x == name) packageNames;
  hasExa = hasPackage "eza";
  hasLazygit = hasPackage "lazygit";
  hasNeovim = config.programs.neovim.enable;
in {
  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    history.size = 10000;
    shellAliases = {
      vim = mkIf hasNeovim "nvim";
      lg = mkIf hasLazygit "lazygit";
      ls = mkIf hasExa "eza";
      exa = mkIf hasExa "eza";
    };
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
