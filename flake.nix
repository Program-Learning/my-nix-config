{
  description = "Advanced example of Nix-on-Droid system config with home-manager.";

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-on-droid,
    nixpkgs-unstable,
    ...
  }: let
    make_nix-on-droid = import ./lib/nix-on-droid.nix;
    aarch64-nix-on-droid_specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
			config.allowUnfree = true;
		};
	} // inputs;
    aarch64-nix-on-droid_base_args = {
      inherit nix-on-droid nixpkgs home-manager;
      system = "aarch64-linux";
	  specialArgs = aarch64-nix-on-droid_specialArgs;
    };
  in {
    nixOnDroidConfigurations.mondrian_1 = make_nix-on-droid (
      aarch64-nix-on-droid_base_args
      // {
        nix-on-droid_modules = [
          ./hosts/nix-on-droid/aarch64/mondrian_1/nix-on-droid.nix
        ];
      }
    );
  };

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nur-ryan4yin = {
      url = "github:ryan4yin/nur-packages";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-urxvt = {
      url = "github:catppuccin/urxvt/ccd8eb763edd0a382b5e9bbfbd9697c4d4129edf";
      flake = false;
    };

  };

}
