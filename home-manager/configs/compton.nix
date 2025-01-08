{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    #package = pkgs.callPackage ../packages/compton-unstable.nix { };
    #experimentalBackends = true;

    #blur = true;
    #blurExclude = [ "window_type = 'dock'" "window_type = 'desktop'" ];

    fade = true;
    fadeDelta = 5;

    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowOpacity = 0.7;
    shadowExclude = [
      "window_type *= 'normal' && ! name ~= ''"
      "x = 0 && y = 0 && override_redirect = true"
    ];
    #noDockShadow = true;
    #noDNDShadow = true;

    activeOpacity = 1;
    inactiveOpacity = 0.8;
    menuOpacity = 0.8;

    backend = "glx";
    vSync = true;

  };
}
