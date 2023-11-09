{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rsync
    ranger
    proxychains
    tmux
    (python311.withPackages (ps:
      with ps; [
        ipykernel jupyterlab 
        matplotlib numpy seaborn
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
      ]))
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
