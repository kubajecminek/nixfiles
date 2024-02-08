{
  config,
  pkgs,
  ...
}: let
  nvchad = pkgs.fetchFromGitHub {
    owner = "nvchad";
    repo = "nvchad";
    rev = "v2.0";
    sha256 = "sha256-J4SGwo/XkKFXvq+Va1EEBm8YOQwIPPGWH3JqCGpFnxY=";
  };
in {
  programs.neovim = {
    enable = true;
  };

  xdg.configFile.nvim = {
    source = nvchad;
    recursive = true;
  };
}
