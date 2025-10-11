{ pkgs, lib, ... }:

let mod = "Mod4";

in {
  xsession.windowManager.i3 = {
    enable = true;
    #package = pkgs.i3-gaps;

    config = {
      modifier = mod;
      bars = [ ];

      #window.default_border = 0;
      #window.default_floating_border = 0;
      window.border = 0;
      gaps = {
        inner = 10;
        outer = 0;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+Return" = "exec kitty";
        "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "XF86AudioLowerVolume" = "exec amixer set Master 10%-";
        "XF86AudioRaiseVolume" = "exec amixer set Master 10%+";
        "XF86AudioMute" = "exec amixer set Master toggle";
      };
      startup = [
        {
          command = "exec i3-msg workspace 1";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/Downloads/webb.png";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
