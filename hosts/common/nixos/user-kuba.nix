{
  pkgs,
  config,
  ...
}: let
  ifGroupExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
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
    hashedPassword = "$6$TbOFsZMEvlYHGnbk$lc4XQYaMteVKTM.ws3aKLLuztIi1KuwqDsAJp1sIWsQM.MxqC5e4c9IAdxMcRRCyBv49NuO4uHNKzN3gEAiq7.";

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
