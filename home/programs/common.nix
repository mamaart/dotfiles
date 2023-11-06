{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo-leptos
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
