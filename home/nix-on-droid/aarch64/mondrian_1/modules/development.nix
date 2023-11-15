{
  pkgs,
  ...
}: let
  my_python = pkgs.python311.withPackages (ps:
    with ps; [
      ipykernel
      #jupyterlab
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
  
        #-- python
    my_python

        #-- golang
    go
    gomodifytags
    iferr # generate error handling code for go
    impl # generate function implementation for go
    gotools # contains tools like: godoc, goimports, etc.
    gopls # go language server
    delve # go debugger

        #-- jdk
    jdk17 # used to run some java based tools(.jar)


    rsync # File Copy/Snyc
    ranger # Terminal FileManager
    proxychains
    tmux # Background Shell process

    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    helix # An editor with lots of functions out of box
    git # Version Manager
    direnv

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
