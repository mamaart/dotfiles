{ pkgs, ... }:

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
  environment.systemPackages =
    [ dwm-status dwm-statusctl ];

  systemd.user.services.statusbar = {
    enable = true;
    description = "The statusbar for dwm";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${dwm-status}/bin/statusbar";
    };
  };
}
