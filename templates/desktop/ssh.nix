{ config, pkgs, ... }: let
  askpass = pkgs.writeShellScriptBin "askpass" ''
    #!/usr/bin/env bash
    # https://mariomoura.com/post/ssh-ask-pass/
    if echo "$1" | grep -q -e "Enter passphrase for" -e "Enter same passphrase again"; then
      # prompt="$\{1:-SSH password:\}"
      rofi -dmenu -password -l 0 -mesg "$1"
    else
      echo "$1" >&2
      read -r CHOICE
      echo "$CHOICE"
    fi
  '';
in {
  config = {
    environment.systemPackages = [ askpass ];
    programs.ssh = {
      startAgent = true;
      setXAuthLocation = true;
      enableAskPassword = true;
      askPassword = "${askpass}/bin/askpass";

      knownHosts = {
        "leaf" = {
          hostNames = [
            "leaf.illegal-crime.org"
            "leaf.home.kappeh.org"
          ];
          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMuKy12mhjVzGb93FXgcaAARZT9bLDTte3D/AmfOkEex leaf_host_key_ed25519";
        };
      };
    };
  };
}

