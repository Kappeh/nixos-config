{ config, lib, pkgs, ... }: {
  options.myModules.virtualisation.qemu.enable = lib.mkEnableOption "Enable QEMU";

  config = lib.mkIf config.myModules.virtualisation.qemu.enable {
    # https://nixos.wiki/wiki/QEMU
    environment.systemPackages = [ pkgs.qemu_kvm ];

    # https://nixos.wiki/wiki/Virt-manager
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    # TODO move into groups/libvirtd.nix
    users.groups.libvirtd.members = [ "kieran" ];

    environment.persistence = lib.mkIf config.myModules.core.impermanence.enable {
      "/persist/system".directories = [
        {
          directory = "/var/lib/libvirt";
          mode = "0755";
        }
      ];
    };
  };
}
