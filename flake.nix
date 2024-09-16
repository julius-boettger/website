{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  # can run on all systems
  inputs.systems.url = "github:nix-systems/default";

  outputs = inputs@{ self, ... }:
  let
    eachSystem = inputs.nixpkgs.lib.genAttrs (import inputs.systems);
  in
  {
    packages = eachSystem (system:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      website = pkgs.stdenv.mkDerivation {
        name = "website";

        src = ./root;

        installPhase = ''
          runHook preInstall

          mkdir -p $out
          cp -r $src/. $out

          runHook postInstall
        '';
      };
    });
  };
}