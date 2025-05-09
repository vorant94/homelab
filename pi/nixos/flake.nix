{
  description = "vorant94-Pi";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      home-manager,
      treefmt-nix,
      ...
    }@inputs:

    let
      vars = import ./shared/vars.nix;
      treefmtEval = treefmt-nix.lib.evalModule nixpkgs.legacyPackages."${vars.system}" ./treefmt.nix;
    in
    {
      nixosConfigurations."${vars.hostname}" = nixpkgs.lib.nixosSystem {
        system = vars.system;
        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${vars.username}" = import ./home/home.nix;
          }
        ];
      };

      formatter."${vars.system}" = treefmtEval.config.build.wrapper;
    };
}
