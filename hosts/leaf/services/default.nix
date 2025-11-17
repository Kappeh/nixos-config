{ ... }: {
  imports = [
    ./gitea.nix # 2000, 2001
    ./ntfy.nix  # 2002, 2003
  ];

  config.users.groups.deploy = {
    name = "deploy";
    gid = 1999;
    members = [
      "ntfy_deploy"
    ];
  };

  config.environment.persistence."/persist/system".directories = [
    {
      directory = "/services";
      user = "kieran";
      group = "deploy";
      mode = "u=rwx,g=rwx,o=";
    }
  ];
}
