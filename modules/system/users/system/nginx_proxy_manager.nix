{ pkgs, ... }: {
  config.users = {
    users.nginx_proxy_manager = {
      uid = 2021;
      group = "nginx_proxy_manager";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.nginx_proxy_manager = {
      name = "nginx_proxy_manager";
      gid = 2021;
      members = [
        "nginx_proxy_manager"
        "kieran"
      ];
    };
  };
}
