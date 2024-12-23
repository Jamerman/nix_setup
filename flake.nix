{
    description = "A simple NixOS flake";

    inputs = {

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
                url = "github:nix-community/nixvim/nixos-24.11";
                inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {
        nixosConfigurations.NixLaptop = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                nixvim.nixosModules.nixvim
                home-manager.nixosModules.home-manager
            ];
        };
    };
}
