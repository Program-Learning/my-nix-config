{
  pkgs,
  config,
  ...
}: {
  terminal.font = "${pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];}}/share/fonts/truetype/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
}
