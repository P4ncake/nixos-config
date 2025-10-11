{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    waybar
    hyprlock
  ];
}
