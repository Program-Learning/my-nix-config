{pkgs, ...}: {
  home.packages = with pkgs; [
    yutto
  ];
}
