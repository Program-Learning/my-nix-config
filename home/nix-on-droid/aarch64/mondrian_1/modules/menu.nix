{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    dmenu
    #rofi
  ];

  programs = {
    # live streaming
    rofi = {
      enable = true;
    };

  };
}
