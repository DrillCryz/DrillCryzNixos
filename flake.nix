{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

      };

      noctalia.url = "github:noctalia-dev/noctalia-shell";
  };

  outputs = { self, nixpkgs, home-manager, noctalia, }: {
    nixosConfigurations.DrillCryz =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.hax = {
            imports = [
              ./home/home.nix
              ./home/noctalia.nix
              noctalia.homeModules.default
            ];
          };

        }
      ];
    };
  };
}
