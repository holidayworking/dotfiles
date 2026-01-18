{
  inputs,
  lib,
  config,
  ...
}:
let
  prefix = "hosts/";

  mkSpecialArgs = hostName: {
    inherit inputs;
    hostConfig = {
      name = hostName;
    };
  };

  buildSystem =
    osType: hostName: module:
    let
      specialArgs = mkSpecialArgs hostName;
    in
    {
      name = hostName;
      value =
        if osType == "darwin" then
          inputs.nix-darwin.lib.darwinSystem {
            inherit specialArgs;
            modules = [
              module
              inputs.home-manager.darwinModules.home-manager
              inputs.nix-homebrew.darwinModules.nix-homebrew
              {
                home-manager.extraSpecialArgs = specialArgs;
              }
            ];
          }
        else if osType == "nixos" then
          inputs.nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [
              module
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager.extraSpecialArgs = specialArgs;
              }
            ];
          }
        else
          throw "Unknown OS type: ${osType}";
    };

  buildConfigurations =
    osType: moduleSet:
    lib.pipe moduleSet [
      (lib.filterAttrs (name: _: lib.hasPrefix prefix name))
      (lib.mapAttrs' (name: module: buildSystem osType (lib.removePrefix prefix name) module))
    ];
in
{
  flake.darwinConfigurations = buildConfigurations "darwin" config.flake.modules.darwin;
  flake.nixosConfigurations = buildConfigurations "nixos" config.flake.modules.nixos;
}
