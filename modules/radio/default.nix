{ pkgs, ...}:

{
  systemd.user.services.radio = {
    enable = true;
    description = "The radio as a background service";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${pkgs.mplayer}/bin/mplayer -nocache -afm ffmpeg https://drliveradio1.akamaized.net/hls/live/2097651/p2/masterab.m3u8";
    };
    #wantedBy = [ "multi-user.target" ];
  };
}
