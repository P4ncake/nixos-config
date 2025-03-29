{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages
    (python-packages: with python-packages; [ pip black flake8 virtualenv ]);
in {
  home.packages = with pkgs; [
    default-python

    feh
    tig
    bat

    kitty
    firefox
    chromium
    vlc

    pavucontrol

    steam
    vulkan-tools
    lutris
  ];
}
