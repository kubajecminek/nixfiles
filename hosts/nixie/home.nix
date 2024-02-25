{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common/home/cli.nix
    ../common/home/git.nix
    ../common/home/emacs
    ../common/home/mbsync.nix
    ../common/home/neovim.nix
    ../common/home/proton.nix
    ../common/home/fonts.nix
    ../common/home/xserver.nix
    ../common/home/wallpaper
  ];

  home.username = "kuba";
  home.homeDirectory = "/home/kuba";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
