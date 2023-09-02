{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    inkscape
    ffmpeg
    mpv
    sxiv
    mplayer
    feh
  ];
}
