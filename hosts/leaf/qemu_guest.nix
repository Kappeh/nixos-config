{
  config = {
    boot.initrd = {
      availableKernelModules = [
        "virtio_net"
        "virtio_pci"
        "virtio_mmio"
        "virtio_blk"
        "virtio_scsi"
        "9p"
        "9pnet_virtio"
        "virtiofs"
      ];
      kernelModules = [
        "virtio_balloon"
        "virtio_console"
        "virtio_rng"
        "virtio_gpu"
      ];
    };
    services.qemuGuest.enable = true;
  };
}

