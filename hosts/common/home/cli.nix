{pkgs, ...}: {
  imports = [./shell.nix];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "gtk2";
    defaultCacheTtl = 86400;
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };

  programs.gpg = {
    enable = true;
    package = pkgs.myUnstableGPG;
  };

  home.packages = with pkgs; [
    tmux
    lazygit
    python312
    eza
    ripgrep
    btop
    fzf
    alejandra
  ];
}
