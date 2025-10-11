{ config, pkgs, lib, ... }:

{
  imports = [ 
    ./zsh.nix 
    ./vim.nix 
    ./i3/i3.nix 
    ./i3/compton.nix 
    ./i3/polybar.nix 
    ./i3/rofi.nix 
  ];
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
