{ config, pkgs, lib, ... }:

{
  imports =
    [ ./zsh.nix ./i3.nix ./compton.nix ./polybar.nix ./rofi.nix ./vim.nix ];
  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    git = {
      enable = true;
      userName = "p4ncake";
      userEmail = "me@p4ncake.fr";
    };
  };

  xsession.enable = true;
}
