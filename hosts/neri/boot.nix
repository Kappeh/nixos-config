{ ... }: {
  config.boot.initrd.luks.devices = {
    # "crypt1" = {
    #   allowDiscards = true;
    #   bypassWorkqueues = true;
    # };
    "crypt2" = {
      allowDiscards = true;
      bypassWorkqueues = true;
    };
    "crypt3" = {
      allowDiscards = true;
      bypassWorkqueues = true;
    };
  };
}
