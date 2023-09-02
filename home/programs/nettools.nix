{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mtr
    nmap
    iftop
  ];
}
