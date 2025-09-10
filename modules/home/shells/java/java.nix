{ config, ... }: {
  config.home.persistence."/persist/home/${config.home.username}".directories = [ ".java" ];
}
