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
    ./others.nix
    # nix-on-droid common
    ../../../common/modules/virtualisation.nix
    ../../../common/modules/x11_catppuccin.nix
    ../../../common/modules/nix.nix
    # common
    ../../../../common/modules/neovim
    ../../../../common/modules/others.nix
    ../../../../common/modules/fhs.nix
  ];
}
