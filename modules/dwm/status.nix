{ pkgs, ... }:

{
  environment.systemPackages =
    let
      dwm-status = pkgs.buildGoModule rec {
        pname = "dwm-status";
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
        pname = "dwm-statusctl";
        version = "0.0.1";
        src = pkgs.fetchFromGitHub {
          owner = "mamaart";
          repo = "dwm-statusctl";
          rev = "v${version}";
          hash = "";
        };
        vendorHash = "sha256-qIiLlwEj8pVK6lTSsKS6kLp7NqxH1mr7ozqhlEIDSdA=";
      };
    in
    [ dwm-status dwm-statusctl ];
}
