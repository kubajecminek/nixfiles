{pkgs, ...}: {
  imports = [./shell.nix];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "emacs";
    defaultCacheTtl = 86400;
    extraConfig = ''
      allow-emacs-pinentry
      allow-loopback-pinentry
    '';
  };

  programs.gpg = {
    enable = true;
    package = pkgs.myUnstableGPG; # I really want to prevent any collision
  };

  home.packages = with pkgs; [
    pinentry-emacs
    tmux
    lazygit
    python312
    eza
    ripgrep
    btop
    fzf
  ];
}
