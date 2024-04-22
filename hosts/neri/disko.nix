{ device ? throw "Set this to your disk device, e.g. /dev/sda", ... }: {
  disko.devices = {
    disk = {
      main = {
        inherit device;
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
                    #"/swap" = {
                    #  mountpoint = "/.swapvol";
                    #  swap.swapfile.size = "17G";
                    #};
                  };
                  mountpoint = "/partition_root";
                  swap.swapfile.size = "17G";
                };
              };
            };
          };
        };
      };
    };
  };
}
