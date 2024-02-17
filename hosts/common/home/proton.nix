{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.protonmail-bridge];

  xdg.configFile."protonmail/bridge-v3/keychain.json".text = ''
    {
      "Helper": "secret-service-dbus"
    }
  '';
}
