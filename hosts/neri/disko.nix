{ ... }: {
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSAFB84723E";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              name = "boot";
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            esp = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "luks";
                name = "root";
                # disable settings.keyFile if you want to use interactive password entry
                passwordFile = "/tmp/secret.key"; # Interactive
                settings = {
                  allowDiscards = true;
                  #keyFile = "/key/keys/workstation/root.key";
                };
                #additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    # The subvolume for `/`, which will be cleared on every boot.
                    "/root" = {
                      mountpoint = "/";
                    };
                    # The subvolume for `/persist`, containing system state and user data which should be persistent and backed up.
                    "/persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    # The subvolume for `/nix`, which needs to be persistent but is not worth backing up, as it's trivial to reconstruct.
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    # The subvolume for `/var/log`, which should be preserved across reboots but I'm not interested in backing up.
                    "/log" = {
                      mountpoint = "/var/log";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    # The subvolume for the swap file, which should be preserved across hibernations but I'm not interested in backing up.
                    "/swap" = {
                      mountpoint = "/.swapvol";
                      mountOptions = [ "noatime" "nodatacow" "nodatasum" ];
                      swap.swapfile.size = "17G";
                    };
                  };
                  mountpoint = "/main_root";
                  # swap.swapfile.size = "17G";
                };
              };
            };
          };
        };
      };
      sshd0 = {
        device = "/dev/disk/by-id/ata-ST1000LM014-1EJ164-SSHD_W3823ZGH";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            p1 = {
              # label = "disk-sshd0-p1"
              size = "100%";
              content = {
                type = "luks";
                name = "p1";
                passwordFile = "/tmp/secret.key";
                settings.allowDiscards = true;
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "/persist" = {
                      mountpoint = "/mnt/sshd0p1_persist";
                    };
                  };
                  mountpoint = "/mnt/sshd0p1_root";
                };
              };
            };
          };
        };
      };
    };
  };
}
