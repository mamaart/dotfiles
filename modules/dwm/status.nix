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
          rev = "v0.0.2";
          sha256 = lib.fakeSha256;
        };

        vendorSha256 = lib.fakeSha256;

        #meta = with lib; {
        #  description = "DWM status bar with todo list";
        #  homepage = "https://github.com/mamaart/dwm-status";
        #  licence = licenses.gpl3;

        #};
      };
    in
    [ some-package ];
}
