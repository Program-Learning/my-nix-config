{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.packages = with pkgs-unstable; [
    man-pages
    man-pages-posix
  ];
  # documentation.dev.enable = true;
}
