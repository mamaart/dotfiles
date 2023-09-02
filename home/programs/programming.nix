{ pkgs, ... }:

{
  home.packages = with pkgs; [
    R
    rustup
    nodejs
  ];
}
