{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnumake
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
