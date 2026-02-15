{ delib, inputs, ... }:
delib.overlayModule {
  name = "code-cursor";
  overlay = final: _prev: {
    code-cursor = final.callPackage "${inputs.code-cursor}/package.nix" {
      vscode-generic =
        final.callPackage "${inputs.nixpkgs}/pkgs/applications/editors/vscode/generic.nix"
          { };
    };
  };
}
