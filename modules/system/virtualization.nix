{ config, pkgs, ... }: {
  config = {
    # https://nixos.wiki/wiki/QEMU
    environment.systemPackages = [ pkgs.qemu_kvm ];

    # https://nixos.wiki/wiki/Virt-manager
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = [ "kieran" ];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    users.users.kieran.extraGroups = [ "libvirtd" ];

    environment.persistence."/persist/system".directories = [
      {
        directory = "/var/lib/libvirt";
        mode = "0755";
      }
    ];
  };
}
