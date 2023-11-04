{ pkgs, ... }:

{
  home.packages = with pkgs; [
    glibc
    tor 

    mupdf
    evince

    ranger
    kubectl

    signal-desktop
  ];
}
