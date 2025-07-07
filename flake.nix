{
  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      systems,
      disko,
      nixpkgs,
      nix-darwin,
      home-manager,
      treefmt-nix,
    }:
    let
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./nix/treefmt.nix);
      lib = import ./nix/lib { inherit inputs; };
    in
    {
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

      darwinConfigurations = {
        macbook-air-m2 = import ./nix/hosts/macbook-air-m2.nix { inherit inputs; };
      };

      nixosConfigurations = {
        macbook-air-m2-utm = import ./nix/hosts/macbook-air-m2-utm.nix { inherit inputs; };
      };
    };
}
