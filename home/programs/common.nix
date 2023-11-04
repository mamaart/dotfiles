{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tor 

    mupdf
    evince

    ranger
    kubectl

    signal-desktop
  ];
}
