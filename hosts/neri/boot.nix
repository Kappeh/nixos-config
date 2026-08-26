{
  config.boot.initrd.luks.devices = {
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
