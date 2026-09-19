{ config, lib, pkgs, ... }: {
  config.programs.nixvim.plugins.lsp = lib.mkIf config.kappeh.development.nixvim.enable {
    enable = true;

    keymaps.lspBuf = {
      K = "hover";
      gD = "references";
      gd = "definition";
      gi = "implementation";
      gt = "type_definition";
    };

    servers = with config.kappeh.development.lsp; {
      # HTML, CSS, JS, C, Java, Kotlin, Markdown, Nginx, postgres, rust, sql, typescript, docker compose, python

      bashls = lib.mkIf bashls.enable {
        enable = true;
        package = pkgs.bash-language-server;
      };

      docker_compose_language_service = lib.mkIf docker_compose_ls.enable {
        enable = true;
        package = pkgs.docker-compose-language-service;
      };

      dockerls = lib.mkIf docker_ls.enable {
        enable = true;
        package = pkgs.docker-ls;
      };

      nixd = lib.mkIf nixd.enable {
        enable = true;
        package = pkgs.nixd;
      };

      rust_analyzer = lib.mkIf rust_analyzer.enable {
        enable = true;
        package = pkgs.rust-analyzer;

        # I have no idea where I found these options but they appear to be fine
        installCargo = false;
        installRustc = false;
      };
    };
  };
}

