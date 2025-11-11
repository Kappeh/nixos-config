{ ... }: {
  imports = [
    ./gitea.nix # 2000
  ];

  config.environment.persistence."/persist/system".directories = [
    {
      directory = "/services";
      user = "kieran";
      group = "kieran";
      mode = "u=rwx,g=rwx,o=";
    }
  ];
}
