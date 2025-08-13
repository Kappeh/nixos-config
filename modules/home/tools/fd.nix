{ config, lib, ... }: {
  options.myModules.tools.fd.enable = lib.mkEnableOption "Enable fd";

  config = lib.mkIf config.myModules.tools.fd.enable {
    programs.fd = {
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
  };
}
