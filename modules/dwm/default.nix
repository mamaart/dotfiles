{pkgs, ...}:

{
  imports = [
    ./status.nix
  ];

  services.xserver = {
    enable = true;

    displayManager.sessionCommands = builtins.readFile ./xinitrc; 

    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.override {
        conf = ./dwm-config.h;
      };
    };

    layout = "us";
    xkbOptions = "eurosign:e,caps:escape";

    libinput.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
        dmenu
        arandr
	(st.override {
	  conf = builtins.readFile ./st-config.h; 
	  patches = [ ./st-anysize.diff ];
	})
    ];
  };
}
