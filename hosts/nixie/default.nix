{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../common/nixos/sys.nix
    ../common/nixos/nix.nix
    ../common/nixos/suckless.nix
    ../common/nixos/user-kuba.nix
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = ["btrfs"];
  hardware.enableRedistributableFirmware = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixie";
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.light.enable = true;

  services.tlp.enable = true;
  powerManagement.enable = true;

  programs = {
    zsh.enable = true;
    virt-manager.enable = true;
  };

  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    cava
    cmus
    gcc
    firefox
    mpv
    transmission-gtk
    (callPackage ../../pkgs/kbd_light {})
  ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11";
}
