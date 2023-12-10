{
  config,
  catppuccin-urxvt,
  ...
} @ args: {
  imports = [
    ./font.nix
    ./development.nix
    # ./creative.nix
    ./menu.nix
    ./dewm.nix
    ./browers.nix
    ./system-tools.nix
    ./ENV_VAR.nix
    ../../../common/modules/x11_catppuccin.nix
    ../../../common/modules/neovim
    #../../../../common/modules/nix.nix
    ../../../common/modules/nix.nix
  ];
}
