{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs-unstable; [
    dmenu
    #rofi
  ];

  programs = {
    rofi = {
      enable = true;
    };
  };
}
