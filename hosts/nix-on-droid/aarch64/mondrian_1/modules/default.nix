{config, ...} @ args: {
  imports = [
    ../../../common/modules/extra_keys.nix
    ../../../common/modules/sshd.nix
    #../../../common/modules/proxychains.nix
    ../../../../common/modules/development_manual.nix
  ];
}
