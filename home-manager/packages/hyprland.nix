{ pkgs, ... }:

{

  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;

  home.packages = with pkgs; [
    wofi
    waybar
    hyprlock
  ];
}
