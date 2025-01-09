# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./i3.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        enableCryptodisk = true;
        device = "nodev";
      };
    };

    initrd.luks.devices = {
      encrypted = {
        device = "/dev/disk/by-uuid/f23d6240-95e2-40e8-841d-553137912d48";
        preLVM = true;
      };
    };

    kernelParams = [ "processor.max_cstate=4" "amd_iomu=soft" "idle=nomwait" ];
    kernelPackages = pkgs.linuxPackages_latest;

  };

  hardware = {
    pulseaudio.enable = true;

    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot =
      true; # powers up the default Bluetooth controller on boot

  };

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Paris";

  services = {
    xserver = {
      enable = true;
      exportConfiguration = true;
      # Enable touchpad support (enabled default in most desktopManager).
      libinput = {
        enable = true;
        touchpad.tapping = false;
      };

      layout = "us";
      xkbVariant = "altgr-intl";
    };

    blueman.enable = true;

    ## udev android
    udev = { packages = [ pkgs.android-udev-rules ]; };
  };

  sound.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.p4ncake = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ discord ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    postgresql
    libpqxx
    gcc

    wget
    tree
    git

    xorg.xbacklight

    rustup
    v4l-utils
    nixfmt

    htop
    ncdu
    zip
    unzip
    gnupg

  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  virtualisation.docker.enable = true;
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}
