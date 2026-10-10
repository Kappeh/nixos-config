{ config, lib, ...}: {
  options.kappeh.hardware.intel.enable = lib.mkEnableOption "Enable Intel";

  config = lib.mkIf config.kappeh.hardware.intel.enable {
    boot.kernelModules = [ "kvm-intel" ];
    hardware.cpu.intel.updateMicrocode = true;
  };
}

