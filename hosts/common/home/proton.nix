{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.protonmail-bridge];

  systemd.user.services.proton = {
    Unit = {
      Description = "ProtonMail Bridge Service";
      After = ["network.target"];
    };
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      Restart = "always";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 20";
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --no-window --noninteractive";
    };
  };

  xdg.configFile."protonmail/bridge-v3/keychain.json".text = ''
    {
      "Helper": "secret-service-dbus"
    }
  '';
}
