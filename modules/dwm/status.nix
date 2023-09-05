{ pkgs, ... }:

{
  environment.systemPackages =
    let
      some-package = pkgs.buildGoModule {
        vendorHash = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";
        src = pkgs.fetchFromGitHub {
          owner = "mamaart";
          repo = "dwm-status";
          rev = "v0.0.1";
          hash = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";
        };
      };
    in
    [ some-package ];
}
