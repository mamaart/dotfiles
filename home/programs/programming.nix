{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    nodePackages.tailwindcss
  ];
}
