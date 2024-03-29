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
    systems = [
      "x86_64-linux"
      "i686-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    make_nix-on-droid = import ./lib/nix-on-droid.nix;

    aarch64-nix-on-droid_specialArgs =
      {
        pkgs-unstable = import nixpkgs-unstable {
          config.allowUnfree = true;
        };
      }
      // inputs;
    aarch64-nix-on-droid_base_args = {
      inherit nix-on-droid nixpkgs home-manager;
      system = "aarch64-linux";
      specialArgs = aarch64-nix-on-droid_specialArgs;
    };

    #-- Users' Configurations
    mondrian_1_modules = {
      nix-on-droid_modules = [
        ./hosts/nix-on-droid/aarch64/mondrian_1/nix-on-droid.nix
      ];
      home-manager_module = import home/nix-on-droid/aarch64/mondrian_1/home.nix;
    };

    pstar_1_modules = {
      nix-on-droid_modules = [
        ./hosts/nix-on-droid/aarch64/pstar_1/nix-on-droid.nix
      ];
      home-manager_module = import home/nix-on-droid/aarch64/pstar_1/home.nix;
    };

    fily_pad_f12_1_modules = {
      nix-on-droid_modules = [
        ./hosts/nix-on-droid/aarch64/fily_pad_f12_1/nix-on-droid.nix
      ];
      home-manager_module = import home/nix-on-droid/aarch64/fily_pad_f12_1/home.nix;
    };
  in {
    formatter = forAllSystems (
      system: nixpkgs.legacyPackages.${system}.alejandra
    );

    nixOnDroidConfigurations = {
      mondrian_1 = make_nix-on-droid (aarch64-nix-on-droid_base_args // mondrian_1_modules);
      pstar_1 = make_nix-on-droid (aarch64-nix-on-droid_base_args // pstar_1_modules);
      fily_pad_f12_1 = make_nix-on-droid (aarch64-nix-on-droid_base_args // fily_pad_f12_1_modules);
    };
  };

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
      "https://nix-on-droid.cachix.org"
    ];
    trustedPublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoUqvHJ9XCp+nidK7qkMQrU="
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
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.11";
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

    # AstroNvim is an aesthetic and feature-rich neovim config.
    astronvim = {
      url = "github:AstroNvim/AstroNvim/v3.37.12";
      flake = false;
    };
  };
}
