{ config, lib, ... }: {
  imports = [
    ./nixcord/default.nix
    ./webcord/default.nix
    ./discord.nix
    ./element_desktop.nix
    ./nicotine_plus.nix
    ./protonmail_desktop.nix
  ];

  options.kappeh.communication.enable = lib.mkEnableOption "Enable communication capability";

  config.kappeh.communication = with config.kappeh; {
    nixcord.enable = lib.mkDefault communication.enable;
    webcord.enable = lib.mkDefault communication.enable;
    discord.enable = lib.mkDefault communication.enable;
    element_desktop.enable = lib.mkDefault communication.enable;
    nicotine_plus.enable = lib.mkDefault communication.enable;
    protonmail_desktop.enable = lib.mkDefault communication.enable;
  };
}

