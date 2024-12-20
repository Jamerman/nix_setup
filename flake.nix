{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }: {

    let
      system = "x86_64-linux";

    in {
        nixosConfigurations = {
            james = lib.nixosSystem {
            inherit system;
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager-useUserPackages = true;
                    home-manager.users.james = {
                        import = 
                ];
            };
        };
    };
  };
}
