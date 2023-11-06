{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo-generate
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
