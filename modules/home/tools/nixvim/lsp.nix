{ config, lib, pkgs, ... }: {
  config.programs.nixvim.plugins.lsp = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;

    servers = {
      # HTML, CSS, JS, C, Java, Kotlin, Markdown, Nginx, postgres, rust, sql, typescript, docker compose, python

      bashls = lib.mkIf config.myModules.tools.lsp.bashls.enable {
        enable = true;
        package = pkgs.bash-language-server;
      };

      docker_compose_language_service = lib.mkIf config.myModules.tools.lsp.docker_compose_ls.enable {
        enable = true;
        package = pkgs.docker-compose-language-service;
      };

      dockerls = lib.mkIf config.myModules.tools.lsp.docker_ls.enable {
        enable = true;
        package = pkgs.docker-ls;
      };

      nixd = lib.mkIf config.myModules.tools.lsp.nixd.enable {
        enable = true;
        package = pkgs.nixd;
      };

      rust_analyzer = lib.mkIf config.myModules.tools.lsp.rust_analyzer.enable {
        enable = true;
        package = pkgs.rust-analyzer;

        # I have no idea where I found these options but they appear to be fine
        installCargo = false;
        installRustc = false;
      };
    };

    keymaps.lspBuf = {
      K = "hover";
      gD = "references";
      gd = "definition";
      gi = "implementation";
      gt = "type_definition";
    };
  };
}
