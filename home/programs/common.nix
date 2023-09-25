{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mupdf
    evince

    ranger
    kubectl

    signal-desktop
  ];
}
