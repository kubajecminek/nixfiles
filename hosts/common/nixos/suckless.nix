{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.layout = "cz";
    xkb.options = "eurosign:e,caps:escape";
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    windowManager.dwm = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dmenu
    st
  ];
}
