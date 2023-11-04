{
  imports = [
    ./programs
    ./shell
    ./editor
  ];

  home = {
    username = "martin";
    homeDirectory = "/home/martin";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
