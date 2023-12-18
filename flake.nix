{
  description = "a nix flake for rofi-blocks";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      drv = import ./build.nix pkgs;
    in {
      overlay = (self: super: {
        rofi-blocks = drv;
      });
      packages.${system}.default = drv;
  };
}
