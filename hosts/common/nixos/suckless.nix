{
  pkgs,
  lib,
  ...
}: let
  singleton = x: [x];
in {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.layout = "cz";
    xkb.options = "eurosign:e,caps:escape";
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    windowManager.session = singleton {
      name = "dwm";
      start = ''
        export _JAVA_AWT_WM_NONREPARENTING=1
        slstatus &
        picom &
        dwm &
        waitPID=$!
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    dwm
    dmenu
    st
    slstatus
    slock
    picom
  ];
}
