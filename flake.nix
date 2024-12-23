{
    description = "A simple NixOS flake";

    inputs = {

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
                url = "github:nix-community/nixvim";
                inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        # Please replace my-nixos with your hostname
        nixosConfigurations.NixLaptop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                # Import the previous configuration.nix we used,
                # so the old configuration file still takes effect
                ./configuration.nix
            ];
        };
    };
}
