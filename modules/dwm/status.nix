{ pkgs, ... }:

{
  environment.systemPackages =
    let
      some-package = pkgs.buildGoModule {
        src = pkgs.fetchFromGitHub {
          owner = "mamaart";
          repo = "dwm-status";
          rev = "v0.0.1";
          sha = "000";
        };
      };
    in
    [ some-package ];
}
