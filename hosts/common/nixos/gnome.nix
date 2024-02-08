{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    xkb.layout = "cz";
    xkb.options = "eurosign:e,caps:escape";
  };

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-connections
      gnome-console
      gnome-photos
      gnome-text-editor
      gnome-tour
      xterm
      gedit
    ])
    ++ (with pkgs.gnome; [
      atomix
      epiphany
      evince
      geary
      gnome-calculator
      gnome-clocks
      gnome-contacts
      gnome-disk-utility
      gnome-font-viewer
      gnome-characters
      gnome-logs
      gnome-maps
      gnome-music
      gnome-screenshot
      gnome-system-monitor
      gnome-terminal
      gnome-weather
      hitori
      cheese
      iagno
      simple-scan
      tali
      totem
    ]);

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  services.gnome.gnome-keyring.enable = true;
}
