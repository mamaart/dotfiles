{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nginx
    gcc
    nodejs
    nodePackages.tailwindcss
  ];
}
