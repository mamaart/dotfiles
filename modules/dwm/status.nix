{ lib, pkgs, ... }:

{
  environment.systemPackages =
    let
      some-package = pkgs.buildGoModule {
        pname = "dwm-status";
        version = "0.0.1";

        #goPackagePath = "github.com/mamaart/dwm-status";

        src = pkgs.fetchFromGitHub {
          owner = "mamaart";
          repo = "dwm-status";
          rev = "v0.0.1";
          hash = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";
        };

        vendorHash = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";

        #meta = with lib; {
        #  description = "DWM status bar with todo list";
        #  homepage = "https://github.com/mamaart/dwm-status";
        #  licence = licenses.gpl3;

        #};
      };
    in
    [ some-package ];
}
