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
      Environment = "PATH=${pkgs.pass}/bin";
      Restart = "always";
      KillMode = "process";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 10";
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive";
    };
  };

  xdg.configFile."protonmail/bridge-v3/keychain.json".text = ''
    {
      "Helper": "secret-service-dbus"
    }
  '';
}
