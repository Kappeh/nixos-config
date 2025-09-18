{ config, lib, ... }: {
  options.myModules.applications.misc.xmrig.enable = lib.mkEnableOption "Enable XMRig";
  config = lib.mkIf config.myModules.applications.misc.xmrig.enable {
    services.xmrig.enable = true;

    sops.secrets."xmrig.json" = {
      format = "json";
      key = "";
      path = "/root/.config/xmrig.json";
      sopsFile = ../../../../secrets/xmrig.json;
    };

    # Disable systemd service, it should be started manually
    systemd.services.xmrig.wantedBy = lib.mkForce [];
  };
}
