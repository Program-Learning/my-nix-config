{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules

  ];
  # Read the changelog before changing this value
  home.stateVersion = "23.05";

  # insert home-manager config
}
