{pkgs, ...}: let
  my_python = pkgs.python311.withPackages (ps:
    with ps; [
      ipykernel
      jupyterlab
      matplotlib
      numpy
      seaborn
      networkx
      beautifulsoup4
      selenium
      urllib3
      pyclip
      pybluez
      pymysql
      jieba
      wordcloud
      pandas-datareader
      pip # use in venv "python -m venv .venv" "source .venv/bin/activate"

      ipython
      pandas
      requests
      pyquery
      pyyaml
    ]);
in {
  home.packages = with pkgs; [
    my_python

    rsync
    ranger
    proxychains
    tmux

    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    git
    neofetch
    openssh
    gnumake

    # Some common stuff that people expect to have
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    ncurses # command clear
    which
    htop
    tree
    netcat # nc
    procps # command ps/pgrep and ...
    lsof
  ];
  programs = {
    zsh = {
      enable = true;
    };
    nushell = {
      enable = true;
    };
    bash = {
      enable = true;
      enableCompletion = true;
    };
    fish = {
      enable = true;
    };
  };
}
