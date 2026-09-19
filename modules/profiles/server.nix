{
  imports = [
    ../nixos/default.nix
  ];

  config.kappeh = {
    development = {
      lsp.enable = true;
      nixvim.enable = true;
      delta.enable = true;
      gh.enable = true;
      git.enable = true;
      lazygit.enable = true;
      nix_index.enable = true;
      nix_search_tv.enable = true;
    };
    hardware.zram.enable = true;
    networking.openssh.enable = true;
    security = {
      gnupg.enable = true;
      ssh.enable = true;
    };
    services.docker.enable = true;
    shell = {
      enable = true;
      terminals.enable = false;
    };
    storage.enable = true;
    workloads.enable = true;
  };
}

