{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    libinput = {
      enable = true;
      touchpad.tapping = false;
    };

    layout = "us";
    xkbVariant = "altgr-intl";

    windowManager.i3 = { enable = true; };
  };
}
