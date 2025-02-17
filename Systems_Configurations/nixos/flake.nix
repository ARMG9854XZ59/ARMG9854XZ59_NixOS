#

# NixOs GhostZ5M9_OS.

# Made and Modified by Alex Mahdi = ~ ARMG0268XZ59.

# Systems Configurations.

# Nix Flakes.

#

{

  description = "Alex Mahdi ARMG0268XZ59 Systems Specials Modified NixOS Config";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
  	
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable }: {

    nixosConfigurations.armg0268xz59 = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      modules = [

        ./configuration.nix

        ./hardware-configuration.nix

      ];
    
    };
  	
  };

	
}
