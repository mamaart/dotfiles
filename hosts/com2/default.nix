{ inputs, config, lib, pkgs, ... }:
let 
  wifiSecrets = import ../../.secrets/wifi.nix { inherit lib; };
in 
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/dwm
    ../../modules/radio
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "com2";
    wireless = {
      enable = true;
      networks = {
        "ssid" = {
	  psk = wifiSecrets.password;
        };
      };
    };
  };

  system.stateVersion = "23.05";
}

