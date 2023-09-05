{pkgs, ...}:

let
  dwm-status = pkgs.buildGoModule {
    pname = "statusbar";
    version = "0.0.2";
    src = builtins.fetchGit {
      url = "https://github.com/mamaart/dwm-status.git";
      ref = "main";
      rev = "dafc1fb792224aa620b5349369f59e3bbddfc089";
    };
    vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
  };
  #dwm-statusctl = pkgs.buildGoModule {
  #  pname = "statusbarctl";
  #  version = "0.0.3";
  #  src = builtins.fetchGit {
  #    url = "https://github.com/mamaart/dwm-statusctl.git";
  #    ref = "main";
  #    rev = "240e60e509a2361be542e481b46fe8b6bc630378";
  #  };
  #  vendorHash = "sha256-JFvC9V0xS8SZSdLsOtpyTrFzXjYAOaPQaJHdcnJzK3s=";
  #};
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
        #dwm-statusctl
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
