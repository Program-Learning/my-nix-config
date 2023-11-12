{
  pkgs,
  ...
}: {
  environment.packages = [
    pkgs.man-pages
    pkgs.man-pages-posix
  ];
  # documentation.dev.enable = true;
}
