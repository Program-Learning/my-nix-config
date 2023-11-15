{
  nixpkgs,
  home-manager,
  nix-on-droid,
  nix-on-droid_modules,
  home-manager_module,
  specialArgs,
  system,
  ...
}:
nix-on-droid.lib.nixOnDroidConfiguration {
  modules =
    nix-on-droid_modules
    ++ [
      # list of extra modules for Nix-on-Droid system
      # { nix.registry.nixpkgs.flake = nixpkgs; }
      # ./path/to/module.nix

      # or import source out-of-tree modules like:
      # flake.nixOnDroidModules.module
      {
        # Configure home-manager
        home-manager = {
          config = home-manager_module;
          extraSpecialArgs = specialArgs;
          backupFileExtension = "hm-bak";
          useGlobalPkgs = true;
        };
      }
    ];

  # list of extra special args for Nix-on-Droid modules
  extraSpecialArgs =
    {
      # rootPath = ./.;
    }
    // specialArgs;

  # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
  pkgs = import nixpkgs {
    inherit system;
    overlays = [
      nix-on-droid.overlays.default
      # add other overlays
    ];
  };

  # set path to home-manager flake
  home-manager-path = home-manager.outPath;
}
