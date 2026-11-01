{ config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  options.kappeh.core.lanzaboote = {
    enable = lib.mkEnableOption "Enable lanzaboote";

    # Be very careful enabling this option
    # https://nix-community.github.io/lanzaboote/how-to-guides/automatically-enroll-keys.html#without-microsoft-keys-potentially-dangerous
    excludeMicrosoftKeys = lib.mkEnableOption "Exclude Microsoft keys";
  };

  config = lib.mkIf config.kappeh.core.lanzaboote.enable {
    environment.systemPackages = [
      pkgs.sbctl
    ];

    boot.lanzaboote = {
      enable = true;

      configurationLimit = 4;

      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;

      autoEnrollKeys = {
        enable = true;

        includeFirmwareBuiltinKeys = true;
        autoReboot = true;

        includeMicrosoftKeys = !config.kappeh.core.lanzaboote.excludeMicrosoftKeys;
        allowBrickingMyMachine = config.kappeh.core.lanzaboote.excludeMicrosoftKeys;
      };

      measuredBoot = {
        enable = true;
        pcrs = [ 0 4 7 ];
      };
    };

    environment.persistence."/persist/system".directories = [
      "/var/lib/sbctl"
      "/var/lib/auto-cryptenroll"
      # config.boot.lanzaboote.measuredBoot.pcrlockPolicy
      config.boot.lanzaboote.measuredBoot.pcrlockDirectory
    ];
  };
}

