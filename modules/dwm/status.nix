{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.buildGoModule {
      pname = "dwm-status";
      version = "0.0.2";
      src = pkgs.fetchFromGitHub {
        owner = "mamaart";
        repo = "dwm-status";
        rev = "v0.0.2";
        hash = "sha256-7xkC8HM+Gwee+Yo79kpEYx6tz7r5msWHNh7suRdF/ck=";
      };
      vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
    }
    pkgs.buildGoModule {
      pname = "dwm-status-ctl";
      version = "0.0.1";
      src = pkgs.fetchFromGitHub {
        owner = "mamaart";
        repo = "dwm-status-ctl";
        rev = "v0.0.1";
        hash = "sha256-7xkC8HM+Gwee+Yo79kpEYx6tz7r5msWHNh7suRdF/ck=";
      };
      vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
    }
  ];
}
