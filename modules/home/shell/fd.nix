{ config, lib, ... }: {
  options.kappeh.shell.fd.enable = lib.mkEnableOption "Enable fd";

  config.programs.fd = lib.mkIf config.kappeh.shell.fd.enable {
    enable = true;

    hidden = true;

    extraOptions = [
      # "--no-ignore"
      "--absolute-path"
    ];

    ignores = [
      ".git/"
      "*.bak"
    ];
  };
}

