{ pkgs, ... }:

{
  home.packages = with pkgs; [
    youtube-dl
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
