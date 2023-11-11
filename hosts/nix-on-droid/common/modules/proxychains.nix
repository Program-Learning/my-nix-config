{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.proxychains = {
    enable = true;
    proxies = {
      myproxy = {
        enable = true;
        type = "socks5";
        host = "127.0.0.1";
        port = 7890;
      };
    };
  };
}
