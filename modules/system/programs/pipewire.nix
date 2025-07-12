{ config, pkgs, ... }: {
  # Disable pulseaudio
  config.services.pulseaudio.enable = false;
  # Use Pipewire
  config.security.rtkit.enable = true;
  config.services.pipewire = {
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
          "default.clock.rate" = 48000;         # default 48000
          "default.clock.min-quantum" = 512;     # default 32
          "default.clock.max-quantum" = 8192;   # default 8192
          "default.clock.quantum" = 1024;       # default 1024
          "default.clock.quantum-limit" = 8192; # default 8192
          "default.clock.quantum-floor" = 4;    # default 4
          "link.max-buffers" = 64;              # default 64
        };
      };
    };

    wireplumber = {
      enable = true;

      extraConfig = {
        "51-hdmi-audio-output"."monitor.alsa.rules" = [{
          matches = [{ "device.name" = "alsa_card.pci-0000_01_00.1"; }];
          actions.update-props = { "device.disabled" = true; };
        }];
        "51-webcam" = {
          "monitor.alsa.rules" = [{
            matches = [{ "device.name" = "alsa_card.usb-Linux_Foundation_USB_Webcam_gadget-02"; }];
            actions.update-props = { "device.disabled" = true; };
          }];
          "monitor.v4l2.rules" = [
            {
              matches = [{ "device.name" = "v4l2_device.pci-0000_00_14.0-usb-0_10_1.0"; }];
              actions.update-props = {
                "device.nick" = "Webcam";
                "device.description" = "Webcam";
              };
            }
            {
              matches = [{ "node.name" = "v4l2_input.pci-0000_00_14.0-usb-0_10_1.0"; }];
              actions.update-props = {
                "node.nick" = "Webcam";
                "node.description" = "Webcam";
              };
            }
          ];
          "monitor.libcamera.rules" = [{
            matches = [{ "device.name" = "libcamera_device.0"; }];
            actions.update-props = {
              "device.nick" = "Webcam";
              "device.description" = "Webcam";
            };
          }];
        };
        "51-built-in"."monitor.alsa.rules" = [
          {
            matches = [{ "device.name" = "alsa_card.pci-0000_00_1b.0"; }];
            actions.update-props = {
              "device.nick" = "System";
              "device.description" = "System";
            };
          }
          {
            matches = [{ "node.name" = "alsa_output.pci-0000_00_1b.0.analog-stereo"; }];
            actions.update-props = {
              "node.nick" = "System";
              "node.description" = "System";
              "priority.driver" = 1010;
              "priority.session" = 1010;
            };
          }
          {
            matches = [{ "node.name" = "alsa_input.pci-0000_00_1b.0.analog-stereo"; }];
            actions.update-props = { "node.disabled" = true; };
          }
        ];
        "51-blue-snowball"."monitor.alsa.rules" = [
          {
            matches = [{ "device.name" = "alsa_card.usb-BLUE_MICROPHONE_Blue_Snowball_201306-00"; }];
            actions.update-props = {
              "device.nick" = "Microphone";
              "device.description" = "Microphone";
            };
          }
          {
            matches = [{ "node.name" = "alsa_input.usb-BLUE_MICROPHONE_Blue_Snowball_201306-00.mono-fallback"; }];
            actions.update-props = {
              "node.nick" = "Microphone";
              "node.description" = "Microphone";
            };
          }
        ];
        "51-sony-xm3"."monitor.bluez.rules" = [
          {
            matches = [{
              # Match any bluetooth device with ids equal to that of a WH-1000XM3
              "device.name" = "~bluez_card.*";
              "device.product.id" = "0x0cd3";
              "device.vendor.id" = "usb:054c";
            }];
            actions.update-props = {
              "bluez5.auto-connect" = [ "a2dp_sink" ];
              "bluez5.hw-volume" = [ "a2dp_sink" ];

              "bluez5.a2dp.ldac.quality" = "auto";
              "bluez5.a2dp.acc.bitratemode" = 0;
              "bluez5.a2dp.opus.pro.application" = "audio";
              "bluez5.a2dp.opus.pro.bidi.application" = "audio";

              "device.nick" = "Headphones";
              "device.description" = "Headphones";
            };
          }
          {
            matches = [{ "node.name" = "bluez_output.38_18_4C_D2_A0_AE.1"; }];
            actions.update-props = {
              "node.nick" = "Headphones";
              "node.description" = "Headphones";
              "node.latency" = "1024/48000"; # 1024 frames for 44100 Hz sample rate
              "priority.driver" = 1011;
              "priority.session" = 1011;
              "resample.quality" = 4;
              "channelmix.normalize" = false;
              "channelmix.mix-lfe" = false;
            };
          }
        ];
        "51-bluetooth" = {
          "monitor.bluez.properties" = {
            "bluez5.default.rate" = 48000;
            "bluez5.roles" = [ "a2dp_sink" "a2dp_source" ];
            "bluez5.codecs" = [ "aac" ];
            "bluez5.enable-hw-volume" = true;
            "bluez5.hfphsp-backend" = "none";
          };
        };
      };
    };
  };
}
