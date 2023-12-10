{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    dmenu
    #rofi
  ];

  programs = {
    rofi = {
      enable = true;
    };

  };
}
