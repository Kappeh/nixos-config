{ ... }: {
  imports = [
    ./gitea.nix    # 2000, 2001, 2006
    ./ntfy.nix     # 2002, 2003
    ./mailrise.nix # 2004, 2005
  ];

  config.users.groups.deploy = {
    name = "deploy";
    gid = 1999;
    members = [
      "gitea_deploy"
      "ntfy_deploy"
      "mailrise_deploy"
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
