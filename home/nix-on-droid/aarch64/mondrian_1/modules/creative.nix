{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # creative
    blender   # 3d modeling
    # gimp      # image editing, I prefer using figma in browser instead of this one
    (gimp-with-plugins.override { 
        plugins = with gimpPlugins; [ 
          fourier
          # resynthesizer # broken since 2023-03-20
          gmic
        ]; 
    })
    inkscape # vector graphics
    krita # digital painting
    musescore # music notation
    reaper # audio production
    sonic-pi # music programming

    # this app consumes a lot of storage, so do not install it currently
    kicad-unstable     # 3d printing, eletrical engineering
    ngspice
    #digital # A digital logic designer and circuit simulator.
    logisim-evolution # Digital logic designer and simulator

    freecad

  ];

  programs = {
    # live streaming
    obs-studio = {
      enable = true;
      plugins = with pkgs; [
      ];
    };
  };
}
