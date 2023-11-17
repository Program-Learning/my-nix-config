{
  config,
  catppuccin-urxvt,
  ...
} @ args: {
  imports = [
    ./font.nix
    ./development.nix
    ./creative.nix
    ./menu.nix
    ./dewm.nix
    ./browers.nix
    ./system-tools.nix
    ../../../common/modules/x11_catppuccin.nix
    ../../../common/modules/neovim
  ];
}
