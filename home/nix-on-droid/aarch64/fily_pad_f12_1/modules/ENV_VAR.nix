{
  pkgs,
  config,
  ...
}: {
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/go/bin"
  ];
  home.sessionVariables = {
    home_sessionVariables_enable = 1;
  };
}
