{
  pkgs,
  config,
  ...
}: let
  ifGroupExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.kuba = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups =
      [
        "wheel"
      ]
      ++ ifGroupExists [
        "video"
        "libvirtd"
        "networkmanager"
      ];

    # I'm not afraid
    hashedPassword = "$y$j9T$Fhm3vpGW74WfdG5W5tr2G/$t7TyYOUyEyJaH6824p/svIaIA5c2pAe8df0ZUthvfL5";

    home = "/home/kuba";

    packages = with pkgs; [
      hugo
      neofetch
      restic
      trezor_agent
      pass
      pulsemixer
    ];
  };
}
