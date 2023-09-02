{
  description = "NixOS configuration of Martin Maartensson";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixvim.url = "github:nix-community/nixvim/nixos-23.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    nixvim,
    ... 
  }: {
    system = "x86_64-linux";

    nixosConfigurations = {

      com2 = nixpkgs.lib.nixosSystem {

        modules = [
          ./hosts/com2
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users.martin.imports = 
                [
                  ./home
                  nixvim.homeManagerModules.nixvim
                ];
            };
          }
        ];
      };

    };
  };
}
