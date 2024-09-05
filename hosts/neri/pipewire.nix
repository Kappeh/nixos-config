{ pkgs, ... }: {
  # Disable pulseaudio
  hardware.pulseaudio.enable = false;
  # Use Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;

    # jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;

    extraConfig = {
      pipewire = {
        "10-context-properties"."context.properties" = {
          "default.clock.rate" = 44100;         # default 48000
          "default.clock.min-quantum" = 32;     # default 32
          "default.clock.max-quantum" = 8192;   # default 8192
          "default.clock.quantum" = 512;        # default 1024
          "default.clock.quantum-limit" = 2048; # default 8192
          "default.clock.quantum-floor" = 4;    # default 4
          "link.max-buffers" = 64;              # default 64
        };
      };
    };

    wireplumber = {
      enable = true;
      extraConfig = {
        "bluetoothEnhancements" = {
          "monitor.bluez.properties" = {
            "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" ];
            "bluez5.codecs" = [ "aptx_ll" "aptx" "aptx_hd" "aac" "sbc" "sbc_xq" ];
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.hfphsp-backend" = "none";
          };
          "monitor.bluez.rules" = [{
            matches = [{
              # Match any bluetooth device with ids equal to that of a WH-1000XM3
              "device.name" = "~bluez_card.*";
              "device.product.id" = "0x0cd3";
              "device.vendor.id" = "usb:054c";
            }];
            actions.update-props = {
              "bluez5.auto-connect" = [ "a2dp_sink" ];
              "bluez5.hw-volume" = [ "a2dp_sink" ];
            };
          }];
        };
      };
    };
  };
}
