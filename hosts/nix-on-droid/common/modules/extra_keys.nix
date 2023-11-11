{
  config,
  lib,
  pkgs,
  ...
}: {
  build.activation.termux = ''
    mkdir -p ~/.termux/
    rm -rf ~/.termux/termux.properties
    cp ${config.build.installationDir}/${./termux.properties} ~/.termux/termux.properties
  '';
}
