{ config, pkgs, ...}:

{
  imports = [
    ./office.nix
    ./archives.nix
    ./browser.nix
    ./common.nix
    ./git.nix
    ./multimedia.nix
    ./nettools.nix
    ./programming.nix
    ./systemtools.nix
    ./utils.nix
  ];
}

