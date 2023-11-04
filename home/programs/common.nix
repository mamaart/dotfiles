{ pkgs, ... }:

{
  home.packages = with pkgs; [
    openssl
    glibc
    tor 

    mupdf
    evince

    ranger
    kubectl

    signal-desktop
  ];
}
