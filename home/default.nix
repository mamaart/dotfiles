{
  imports = [
    ./programs
    ./shell
    ./editor
    ./tor.nix
  ];

  home = {
    username = "martin";
    homeDirectory = "/home/martin";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
