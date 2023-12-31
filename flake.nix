{
  description = "NixOS configuration of Martin Maartensson";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    crane = {
      url = "github:ipetkov/crane";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{
    self,
    crane,
    nixpkgs,
    home-manager,
    nixvim,
    ... 
  }: 
  let 
    system = "x86_64-linux";
    craneLib = crane.lib.${system};
  in
  {
    packages.default = craneLib.buildPackage {
      src = craneLib.cleanCargoSource (craneLib.path ./.);
    };

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
