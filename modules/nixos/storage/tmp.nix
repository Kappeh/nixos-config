{
  config = {
    environment.persistence."/persist/system" = {
      directories = [
        # Used widely by build tools and editors which may accidentally
        # fill up the tmpfs for large projects. `/tmp` is cleaned on boot anyway.
        "/tmp"
        # /var/tmp is meant for temporary files that are preserved across reboots
        # https://wiki.archlinux.org/title/Tmpfs#Usage
        # https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html
        "/var/tmp"
      ];
    };

    boot.tmp.cleanOnBoot = true;
  };
}

