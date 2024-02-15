{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [
    man-pages
    man-pages-posix
  ];
  documentation.dev.enable = true;
}
