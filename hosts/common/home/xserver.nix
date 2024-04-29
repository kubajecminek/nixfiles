{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine-gtk";
      package = pkgs.rose-pine-gtk-theme;
    };
  };

  home.packages = [pkgs.rose-pine-icon-theme];

  home.file.".Xresources".text = ''
    st.font: JetBrainsMono Nerd Font Mono-9;

    ! window padding
    st.borderpx: 20

    !- 0.1 to 0.9 = transparency
    st.alpha: 0.9

    *.color0: #1d2021
    *.color1: #cc241d
    *.color2: #98971a
    *.color3: #d79921
    *.color4: #458588
    *.color5: #b16286
    *.color6: #689d6a
    *.color7: #a89984
    *.color8: #928374
    *.color9: #fb4934
    *.color10: #b8bb26
    *.color11: #fabd2f
    *.color12: #83a598
    *.color13: #d3869b
    *.color14: #8ec07c
    *.color15: #ebdbb2
    *.background: #282828
    *.foreground: white
    *.cursorColor: white
  '';
}
