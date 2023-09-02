{ config, pkgs, ...}:
{
  fonts.fonts = with pkgs; [ 
    (nerdfonts.override { fonts = [ "Meslo" ]; })
  ];

  time.timeZone = "Europe/Copenhagen";

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;


  users = {
    defaultUserShell = pkgs.zsh;
    users.martin = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  environment = {
    shells = with pkgs; [
      zsh
    ];
    systemPackages = with pkgs; [
      git
      vim
      brightnessctl
      rsync
    ];

    variables.EDITOR = "vim";
  };

  services.udisks2.enable = true;

  networking.firewall.enable = true;
}
