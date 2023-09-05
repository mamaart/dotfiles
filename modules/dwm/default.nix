{pkgs, ...}:
let
  dwm-status = pkgs.buildGoModule {
    pname = "statusbar";
    version = "0.0.2";
    src = builtins.fetchGit {
      url = "https://github.com/mamaart/dwm-status.git";
      ref = "main";
      rev = "f711ee390b95c6481c53722d74500dae32517bb9";
    };
    vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
  };
in 
{
  services.xserver = {
    enable = true;

    displayManager = {
      sessionCommands = ''
        ${dwm-status}/bin/statusbar &
      '';
    };

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
        dwm-status
    ];
  };
}
