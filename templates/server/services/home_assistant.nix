{ pkgs, ... }: {
  config.users = {
    users.home_assistant = {
      uid = 2019;
      group = "home_assistant";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.home_assistant = {
      name = "home_assistant";
      gid = 2019;
      members = [
        "home_assistant"
        "kieran"
      ];
    };
  };
}
