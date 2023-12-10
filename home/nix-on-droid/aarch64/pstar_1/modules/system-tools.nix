{pkgs, ...}: {
  # Linux Only Packages, not available on Darwin
  home.packages = with pkgs; [
    nmon
    iotop
    iftop

    # misc
    libnotify
    wireguard-tools # manage wireguard vpn manually, via wg-quick

    # need to run `conda-install` before using it
    # need to run `conda-shell` before using command `conda`
    # conda is not available for MacOS
    conda

    # (lib.lowPrio busybox)

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    bpftrace # powerful tracing tool
    tcpdump  # network sniffer
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    #pciutils # lspci
    #usbutils # lsusb
    hdparm # for disk performance, command
    #dmidecode # a tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard



    neofetch
    ranger # terminal file manager(batteries included, with image preview support)

    # archives
    zip
    xz
    unzip
    p7zip

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    iproute2
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses


    # Text Processing
    # Docs: https://github.com/learnbyexample/Command-line-text-processing
    gnugrep  # GNU grep, provides `grep`/`egrep`/`fgrep`
    gnused  # GNU sed, very powerful(mainly for replacing text in files)
    gawk   # GNU awk, a pattern scanning and processing language
    ripgrep # recursively searches directories for a regex pattern
    sad  # CLI search and replace, with diff preview, really useful!!!
    delta  # A viewer for git and diff output
    # A fast and polyglot tool for code searching, linting, rewriting at large scale
    # supported languages: only some mainstream languages currently(do not support nix/nginx/yaml/toml/...)
    ast-grep
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq

    # misc
    tldr
    cowsay
    file
    which
    tree
    gnutar
    zstd
    caddy
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix
    # with more details log output
    nix-output-monitor
    nodePackages.node2nix

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
  ];

  # auto mount usb drives
  services = {
    udiskie.enable = true;
  };

  services = {
    # syncthing.enable = true;
  };
}
