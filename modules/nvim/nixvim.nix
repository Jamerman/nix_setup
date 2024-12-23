{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
      let
        nixvimModule = {
          inherit pkgs;
          module = import ./nvim_config.nix;
        };
      in {
        nixosModules = {
          nixvim = nixvimModule;
        };
        # Other outputs...
      };
}

