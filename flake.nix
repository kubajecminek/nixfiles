{
  description = "Nix config for *Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs: let
    overlays = [(import ./overlays inputs)];
  in {
    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/nixie
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.kuba = import ./hosts/nixie/home.nix;
        }
        home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen3
        ({
          config,
          pkgs,
          ...
        }: {nixpkgs.overlays = overlays;})
      ];
    };
  };
}
