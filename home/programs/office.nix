{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    hugo
    texlive.combined.scheme-full
  ];
}
