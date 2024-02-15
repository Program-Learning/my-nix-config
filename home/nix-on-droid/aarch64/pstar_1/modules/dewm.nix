{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs-unstable; [
    xdg-utils
  ];
}
