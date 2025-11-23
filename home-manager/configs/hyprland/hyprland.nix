{
  wayland.windowManager.hyprland.settings = {
    monitor = ",1920x1200, 0x0, 1";

    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$menu" = "wofi --show drun";
    "$fileManager" = "dolphin";

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      resize_on_border = true;

      # layout = dwindle;
      allow_tearing = false;
    };

    decoration = {
      rounding = 0;
      active_opacity = 1.0;
      inactive_opacity = 0.8;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };

    };

    misc = {
      force_default_wallpaper = 1;
      disable_hyprland_logo = true;
    };

    input = {
      kb_layout = "us";
      kb_variant = "altgr-intl";

      touchpad = {
        disable_while_typing = true;
        tap-to-click = false;
      };
    };

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind = [
      # Screen lock
      "$mod, L, exec, hyprlock"

      # Generic binds
      "$mod, Return, exec, $terminal"
      "$mod, C, killactive,"
      "$mod, M, exit,"
      "$mod, E, exec, $fileManager"
      "$mod, V, togglefloating,"
      "$mod, D, exec, $menu"
      "$mod, P, pseudo,"
      "$mod, J, togglesplit,"

      # Focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Scratchpad
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"

      # Move
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"
    ]
    ++ (
      # workspaces binds
      builtins.concatLists (builtins.genList
        (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
    );

    exec-once = [
      "waybar"
      "hyprpaper"
      "firefox"
    ];

    env = [
      "XCURSOR_SIZE,6"
      "HYPRCURSOR_SIZE,6"
    ];
  };
}
