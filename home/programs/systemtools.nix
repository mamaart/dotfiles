{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xclip

    which
    tree
    gawk
    bat

    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring

    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
