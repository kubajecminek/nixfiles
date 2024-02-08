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

    hashedPassword = "pass";

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
