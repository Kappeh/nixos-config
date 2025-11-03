{ config, lib, pkgs, ... }:
let
  sudachi = pkgs.stdenv.mkDerivation rec {
    pname = "sudachi";
    version = "1.0.14";

    src = pkgs.fetchurl {
      url = "https://www.dropbox.com/scl/fi/6ajrwkwmx657q1ns7c5qg/sudachiemulator.org-linux-v1.0.14.7z?rlkey=9dgnllblsu3fn1paxlzfja55l&st=wz0ji8go&dl=1";
      sha256 = "sha256-AX6YarEIT736sZaWEQGJRmOqjM13z5lo3Zvbns8+xPE=";
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
      pkgs.p7zip

      # libva.so.2
      pkgs.libva
      # libQt6WebEngineCore.so.6
      pkgs.kdePackages.qtwebengine
      # libQt6Network.so.6
      # libQt6Widgets.so.6
      # libQt6Gui.so.6
      # libQt6Core.so.6
      pkgs.kdePackages.qtbase
      # libstdc++.so.6
      # libgcc_s.so.1
      pkgs.gcc
      # libudev.so.1
      pkgs.libudev-zero
      # libssl.so.3
      # libcrypto.so.3
      pkgs.openssl_3
      # libdrm.so.2
      pkgs.libdrm
      # libbrotlienc.so.1
      # libbrotlidec.so.1
      pkgs.brotli

      # qtbase requires us to specify wrapping behavior
      pkgs.kdePackages.wrapQtAppsHook
    ];

    unpackPhase = ''
      7z x $src
    '';

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin/
      runHook preInstall
      install -m755 -D sudachi $out/bin/sudachi
      install -m755 -D sudachi-cmd $out/bin/sudachi-cmd
      install -m755 -D sudachi-room $out/bin/sudachi-room
      runHook postInstall
    '';

    meta = {
      description = "Sudachi is a Nintendo Switch emulator for Android, Linux, macOS and Windows, written in C++";
      homepage = "https://sudachiemulator.org/";
      sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
      platforms = lib.platforms.all;
      license = lib.licenses.gpl3; # This is actually a multi-license project, gpl3 is just the one in the root of the repo
    };
  };
in {
  options.myModules.applications.emulation.sudachi.enable = lib.mkEnableOption "Enable Sudachi";

  config = lib.mkIf config.myModules.applications.emulation.sudachi.enable {
    home.packages = [ sudachi ];

    xdg.desktopEntries.sudachi = {
      name = "Sudachi";
      genericName = "Switch Emulator";
      comment = "A Nintendo Switch emulator";
      exec = "bash -ic \"QT_QPA_PLATFORM=xcb ${sudachi}/bin/sudachi\"";
      terminal = false;
      type = "Application";
      categories = [ "Game" "Emulator" ];
    };

    home.persistence."/persist/home/${config.home.username}".directories = [
      ".config/sudachi"
      ".local/share/sudachi"
    ];
  };
}
