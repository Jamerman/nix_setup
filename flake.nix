{
    description = "A flake from which the rest of the system is enabled.";

    inputs = {

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            ./modules/nvim/nixvim.nix;
#                 url = "github:nix-community/nixvim/nixos-24.11";
#                 inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {
        nixosConfigurations.NixLaptop = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
        		nixvim.nixosModules.nixvim
            ];
        };
    };
}
