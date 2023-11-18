{
  pkgs,
  lib,
  config,
  ...
}: {
  nix.settings.substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store" "https://mirrors.ustc.edu.cn/nix-channels/store"];
  # may throw exception?I dont know
  #nix.package = pkgs.nix;
}
