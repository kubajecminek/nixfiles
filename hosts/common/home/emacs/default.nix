{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    (pkgs.notmuch.override {emacs = pkgs.emacs29-gtk3;})
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-gtk3;

    extraPackages = epkgs:
      with epkgs;
        [
          magit
          evil
          paredit
          pdf-tools
          doom-themes
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
