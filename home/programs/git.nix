{ pkgs, ...}:

{
  programs.git = {
    enable = true;

    userName = "Martin Maartensson";
    userEmail = "martinmaartensson@gmail.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  home.packages = with pkgs; [
    git-crypt
  ];

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };
  
}
