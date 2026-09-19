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
    gaming.enable = true;
    hardware = {
      logiops.enable = true;
      bluetooth.enable = true;
      libinput.enable = true;
      nvidia.enable = true;
      opengl.enable = true;
      upower.enable = true;
      zram.enable = true;
    };
    media = {
      enable = true;
      davinci_resolve.enable = false;
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

