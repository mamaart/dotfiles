{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    nodejs
    nodePackages.tailwindcss
  ];
}
