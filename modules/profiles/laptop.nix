{
  imports = [
    ../nixos/default.nix
  ];

  config.kappeh = {
    applications.enable = true;
    audio.enable = true;
    communication = {
      enable = true;
      discord.enable = false;
    };
    desktop.enable = true;
    development.enable = true;
    gaming = {
      enable = true;
      alvr.enable = false;
      sidequest.enable = false;
      r2modman.enable = false;
      supertuxkart.enable = false;
    };
    hardware = {
      bluetooth.enable = true;
      intel.enable = true;
      libinput.enable = true;
      opengl.enable = true;
      upower.enable = true;
      zswap.enable = true;
    };
    media = {
      easyeffects.enable = true;
      feishin.enable = true;
      gimp.enable = true;
      vlc.enable = true;
    };
    networking.enable = true;
    security.enable = true;
    services.enable = true;
    shell = {
      enable = true;
      scripts.fs_diff.enable = true;
    };
    storage.enable = true;
  };
}

