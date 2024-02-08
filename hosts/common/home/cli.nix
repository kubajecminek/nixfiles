{pkgs, ...}: {
  imports = [./shell.nix];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "curses";
  };

  programs.gpg = {
    enable = true;
  };

  home.packages = with pkgs; [
    gpg-tui
    pinentry-curses
    tmux
    lazygit
    python312
    eza
    ripgrep
    btop
    fzf
  ];
}
