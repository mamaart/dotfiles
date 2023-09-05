{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.buildGoModule {
        pname = "dwm-status";
        version = "0.0.1";

        #goPackagePath = "github.com/mamaart/dwm-status";

        src = pkgs.fetchFromGitHub {
          owner = "mamaart";
          repo = "dwm-status";
          rev = "v0.0.2";
          hash = "sha256-7xkC8HM+Gwee+Yo79kpEYx6tz7r5msWHNh7suRdF/ck=";
        };

        vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";

        #meta = with lib; {
        #  description = "DWM status bar with todo list";
        #  homepage = "https://github.com/mamaart/dwm-status";
        #  licence = licenses.gpl3;

        #};
      }
    ];
}
