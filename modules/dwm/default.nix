{pkgs, ...}:

let
  dwm-status = pkgs.buildGoModule rec {
    pname = "statusbar";
    version = "0.0.2";
    src = pkgs.fetchFromGitHub {
      owner = "mamaart";
      repo = "dwm-status";
      rev = "v${version}";
      hash = "sha256-7xkC8HM+Gwee+Yo79kpEYx6tz7r5msWHNh7suRdF/ck=";
    };
    vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
  };
  dwm-statusctl = pkgs.buildGoModule rec {
    pname = "statusbarctl";
    version = "0.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "mamaart";
      repo = "dwm-statusctl";
      rev = "v${version}";
      hash = "sha256-7xkC8HM+Gwee+Yo79kpEYx6tz7r5msWHNh7suRdF/ck=";
    };
    vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
  };
in {
  services.xserver = {
    enable = true;

    displayManager.sessionCommands = ''
      ${dwm-status}/bin/statusbar &
    '';

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
    systemPackages = [
        dwm-statusctl
        dwm-status
        pkgs.dmenu
        pkgs.arandr
	(pkgs.st.override {
	  conf = builtins.readFile ./st-config.h; 
	  patches = [ ./st-anysize.diff ];
	})
    ];
  };
}
