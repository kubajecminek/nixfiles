{
  pkgs,
  lib,
  ...
}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-gtk3;

    extraPackages = epkgs:
      with epkgs;
        [
          magit
          evil
          pinentry
          paredit
        ]
        ++ [
          (callPackage ../../../../pkgs/klid {
            inherit lib;
            inherit (pkgs) fetchFromGitHub;
            inherit (epkgs) trivialBuild;
          })
        ];
    extraConfig = builtins.readFile ./init.el;
  };
}
