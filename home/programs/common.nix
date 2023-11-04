{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgconf
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
