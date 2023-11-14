with import <nixpkgs> {}; let
  id_c = writeText "id.c" ''
    #include <sys/types.h>
    #include <stdio.h>

    int setgid(gid_t gid){ printf("WARNING: setgid stubbed"); return 0; }
    int setuid(uid_t uid){ printf("WARNING: setuid stubbed"); return 0; }
  '';

  id_so = runCommand "id.so" {buildInputs = [gcc];} ''
    mkdir -p $out
    gcc -std=c99 -shared -fPIC ${id_c} -o $out/id.so
  '';
  catppuccin-urxvt = fetchTarball("https://github.com/catppuccin/urxvt/archive/master.tar.gz");

  myx = writeShellScriptBin "myx" ''
    export DISPLAY=$1 #TODO dynamic?
    LD_PRELOAD=${id_so}/id.so ${xorg.xorgserver}/bin/Xvfb $1 -ac -listen tcp &
    sleep 5
    ${x11vnc}/bin/x11vnc -display $1 -passwd test -rfbport 5902 -noshm -forever &  #not sure why noshm still needed

    ${xorg.xrdb}/bin/xrdb -merge ~/.Xresources
    ${xorg.xrdb}/bin/xrdb -merge "${catppuccin-urxvt}/mocha.Xresources"
    # ${xorg.xrdb}/bin/xrdb -merge ${builtins.readFile "${catppuccin-urxvt}/mocha.Xresources"}

    awesome &

    urxvt -e env TERM=xterm tmux & #TODO probably wrong

    # only background and fontcolor
    # urxvt -bg "#14141F" -fg "#FFFFFF" -e env TERM=xterm tmux &
  '';
in
  mkShell {buildInputs = [myx awesome rxvt-unicode tmux];}
