{ config, pkgs, lib, ... }:

{
  imports = [ ./zsh.nix ./i3.nix ./compton.nix ./polybar.nix ./rofi.nix ];
  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    git = {
      enable = true;
      userName = "p4ncake";
      userEmail = "me@p4ncake.fr";
    };
    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ vim-airline nerdtree ];
      settings = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
        number = true;

      };
      extraConfig = "\n        set hlsearch\n        filetype on\n      ";
    };
  };

  xsession.enable = true;
}
