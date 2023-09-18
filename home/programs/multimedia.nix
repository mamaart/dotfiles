{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    obs-studio
    inkscape
    imagemagick
    ffmpeg
    mpv
    sxiv
    mplayer
    feh
  ];
}
