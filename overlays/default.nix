inputs: let
  inherit (inputs) nixpkgs-unstable;
in
  final: prev: rec {
    unstable = nixpkgs-unstable.legacyPackages.${prev.system};

    st = prev.st.overrideAttrs (old: {
      src = builtins.fetchTarball {
        url = "https://github.com/siduck/st/archive/master.tar.gz";
        sha256 = "sha256:0g2zmkvgfz2ksfxqsxqybk6395v17x71l37wbm6znrp6j8vcbhpj";
      };
      buildInputs = old.buildInputs ++ [prev.harfbuzz prev.gd prev.glib];
    });

    dwm = prev.dwm.overrideAttrs (old: {
      patches =
        (old.patches or [])
        ++ [
          (prev.fetchpatch {
            url = "https://dwm.suckless.org/patches/keycodes/dwm-keycodes-6.4.diff";
            hash = "sha256-bWLxX3NX7NRPY5kiwwKl72Wm93/Lfd/z8YTP1/xn3So=";
          })
          ./0001-dwm-Adjust-config.def.h.patch
        ];
    });

    slstatus = prev.slstatus.overrideAttrs (old: {
      patches =
        (old.patches or [])
        ++ [
          ./0001-slstatus-Adjust-config.def.h.patch
        ];
    });

    protonmail-bridge = unstable.protonmail-bridge.overrideAttrs (old: {
      patches =
        (old.patches or [])
        ++ [
          ./0001-Gnus-Fix-disable-parallelism.patch
        ];
    });

    myUnstableGPG = unstable.gnupg;

    notmuch = prev.notmuch.overrideAttrs (old: {
      withEmacs = true;
      withRuby = false;
      withSfsexp = false;

      meta =
        old.meta
        // {
          outputsToInstall = ["out" "man" "info" "emacs"];
        };
    });
  }
