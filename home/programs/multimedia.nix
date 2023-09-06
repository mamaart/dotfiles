{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    inkscape
    imagemagick
    ffmpeg
    mpv
    sxiv
    mplayer
    feh
  ];
}
