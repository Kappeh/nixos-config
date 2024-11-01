{ config, ... }: {
  config.programs.fd = {
    enable = true;

    hidden = true;

    extraOptions = [
      # "--no-ignore"
      "--absolute-path"
    ];

    ignores = [
      ".git/"
      "*.bak"
    ];
  };
}
