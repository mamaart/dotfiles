{ pkgs, ...}:

{
  systemd.user.services.dr2 = {
    enable = true;
    description = "The radio as a background service";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${pkgs.mplayer}/bin/mplayer -nocache -afm ffmpeg https://drliveradio1.akamaized.net/hls/live/2097651/p2/masterab.m3u8";
    };
  };
  systemd.user.services.cumbia = {
    enable = true;
    description = "The radio as a background service";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${pkgs.mplayer}/bin/mplayer -nocache http://streaming.hdserver.biz:9300/stream/1/";
    };
  };
}
