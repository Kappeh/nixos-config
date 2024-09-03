{ ... }: {
  # Disable pulseaudio
  hardware.pulseaudio.enable = false;
  # Use Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        # Disable HSP/HFP profile
        # https://wiki.archlinux.org/title/Bluetooth_headset#Switch_between_HSP/HFP_and_A2DP_setting
        # "monitor.bluez.rules" = [
        #   {
        #     matches = [ { "device.name" = "~bluez_card.*"; } ];
        #     actions.update-props = {
        #      "bluez5.auto-connect" = [ "a2dp_sink" ];
        #      "bluez5.hw-volume" = [ "a2dp_sink" ];
        #     };
        #   }
        # ];

        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;

          "bluez5.roles" = [ "a2dp_sink" ];
          "bluez5.hfphsp-backend" = "none";
        };

        "wh-1000xm3-ldac-hq" = {
          "monitor.bluez.rules" = [
            {
              matches = [
                {
                  # Match any bluetooth device with ids equal to that of a WH-1000XM3
                  "device.name" = "~bluez_card.*";
                  "device.product.id" = "0x0cd3";
                  "device.vendor.id" = "usb:054c";
                }
              ];
              actions = {
                update-props = {
                  # Set quality to high quality instead of the default of auto
                  "bluez5.a2dp.ldac.quality" = "hq";
                  "bluez5.auto-connect" = [ "a2dp_sink" ];
                  "bluez5.hw-volume" = [ "a2dp_sink" ];
                };
              };
            }
          ];
        };
      };
    };
  };
}
