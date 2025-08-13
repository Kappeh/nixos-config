{ config, inputs, lib, osConfig, ... }: {
  options.myModules.applications.browsers.librewolf.enable = lib.mkEnableOption "Enable LibreWolf";

  config = lib.mkIf config.myModules.applications.browsers.librewolf.enable {
    programs.librewolf = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
        isDefault = true;

        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          buster-captcha-solver
          clearurls
          consent-o-matic
          darkreader
          decentraleyes
          keepassxc-browser
          simplelogin
          sponsorblock
          ublock-origin
        ];

        search = {
          force = true;
          default = "ddg";
          order = [ "ddg" ];
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "https://search.nixos.org/favicon.png";
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              icon = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "ddg" = {
              urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
              icon = "https://duckduckgo.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@duckduckgo" "@ddg" ];
            };
            "Youtube" = {
              urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
              icon = "https://www.youtube.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@youtube" "@yt" ];
            };
            "Crates.io" = {
              urls = [{ template = "https://crates.io/search?q={searchTerms}"; }];
              icon = "https://crates.io/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@crates" ];
            };
            "Home Manager Options" = {
              urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}"; }];
              icon = "https://home-manager-options.extranix.com/images/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@hm" ];
            };
            "Arch Wiki" = {
              urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
              icon = "https://wiki.archlinux.org/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@arch" "@aw" ];
            };
            "reddit" = {
              urls = [{ template = "https://www.reddit.com/search/?q={searchTerms}"; }];
              icon = "https://www.redditstatic.com/shreddit/assets/favicon/64x64.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@reddit" ];
            };
            "Nix Options" = {
              urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
              icon = "https://nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@no" ];
            };
            "Steam" = {
              urls = [{ template = "https://store.steampowered.com/search/?term={searchTerms}"; }];
              icon = "https://store.steampowered.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@steam" ];
            };
            "ProtonDB" = {
              urls = [{ template = "https://www.protondb.com/search?q={searchTerms}"; }];
              icon = "https://www.protondb.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@protondb" "@pdb" ];
            };
            "SteamDB" = {
              urls = [{ template = "https://steamdb.info/search/?a=all&q={searchTerms}"; }];
              icon = "https://steamdb.info/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@steamdb" "@sdb" ];
            };
            "Github" = {
              urls = [{ template = "https://github.com/search?q={searchTerms}&type=repositories"; }];
              icon = "https://github.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@gh" ];
            };
            "DockerHub" = {
              urls = [{ template = "https://hub.docker.com/search?q={searchTerms}"; }];
              icon = "https://hub.docker.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@dh" ];
            };
            "Factorio Wiki" = {
              urls = [{ template = "https://wiki.factorio.com/index.php?search={searchTerms}"; }];
              icon = "https://wiki.factorio.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@fw" ];
            };
            "Barotrauma Wiki" = {
              urls = [{ template = "https://barotraumagame.com/baro-wiki/index.php?search={searchTerms}"; }];
              icon = "https://barotraumagame.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@bw" ];
            };
            "Terraria Wiki" = {
              urls = [{ template = "https://terraria.wiki.gg/wiki/Special:Search?search={searchTerms}"; }];
              icon = "https://terraria.wiki.gg/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@tw" ];
            };
            "Urban Dictionary" = {
              urls = [{ template = "https://www.urbandictionary.com/define.php?term={searchTerms}"; }];
              icon = "https://www.urbandictionary.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@ud" ];
            };
            "Whois" = {
              urls = [{ template = "https://www.whois.com/whois/{searchTerms}"; }];
              icon = "https://www.whois.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@whois" ];
            };
            "Thingiverse" = {
              urls = [{ template = "https://www.thingiverse.com/search?q={searchTerms}"; }];
              icon = "https://www.thingiverse.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@thing" ];
            };
            "Modrinth Mods" = {
              urls = [{ template = "https://modrinth.com/mods?q={searchTerms}"; }];
              icon = "https://modrinth.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@mod" ];
            };
            "Modrinth Plugins" = {
              urls = [{ template = "https://modrinth.com/plugins?q={searchTerms}"; }];
              icon = "https://modrinth.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@plugin" ];
            };
            "Minecraft Wiki" = {
              urls = [{ template = "https://minecraft.wiki/w/Special:Search?search={searchTerms}"; }];
              icon = "https://minecraft.wiki/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@mw" ];
            };
            "Stardew Valley Wiki" = {
              urls = [{ template = "https://www.stardewvalleywiki.com/mediawiki/index.php?search={searchTerms}"; }];
              icon = "https://stardewvalleywiki.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@sw" ];
            };
            "google".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "policy-DuckDuckGo Lite".metaData.hidden = true;
            "policy-MetaGer".metaData.hidden = true;
            "policy-Mojeek".metaData.hidden = true;
            "policy-SearXNG - searx.be".metaData.hidden = true;
            "policy-StartPage".metaData.hidden = true;
          };
        };

        settings = {
          # Remove the god aweful border around the window
          "browser.tabs.inTitlebar" = 0;
          # Apparently allows transparency
          # TODO: transparent top menu / tabs
          "browser.tabs.allow_transparent_browser" = true;
    # Enable DRM
    "drm" = true;
    "media.eme.enabled" = true;

          # Performance
          "gfx.webrender.all" = true; # Force enable GPU acceleration
          "media.ffmpeg.vaapi.enabled" = true;
          "widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes

          # Keep the reader button enabled at all times
          "reader.parse-on-load.force-enabled" = true;

          # New Windows and Tabs
          "browser.startup.blankWindow" = true;

          # Firefox Home Content (Even if it's disabled)
          "browser.newtabpage.activity-stream.showSearch" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;

          # Remove suggestions
          "browser.search.suggest.enabled.private" = false;
          "browser.urlbar.suggest.enabled" = false;
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.history" = false;
          "browser.urlbar.suggest.openpage" = false;
          "browser.urlbar.suggest.topsites" = false;
          "browser.urlbar.suggest.pocket" = false;
          "browser.urlbar.suggest.mdn" = false;
          "browser.urlbar.suggest.recentsearches" = false;
          "browser.urlbar.suggest.remotetab" = false;
          "browser.urlbar.suggest.weather" = false;
          "browser.urlbar.suggest.trending" = false;
          "browser.urlbar.suggest.yelp" = false;

          # Privacy
          "app.update.auto" = false;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.ctrlTab.recentlyUsedOrder" = false;
          "browser.laterrun.enabled" = false;
          "browser.protections_panel.infoMessage.seen" = true;
          "browser.quitShortcut.disabled" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "datareporting.policy.dataSubmissionEnable" = false;
          "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
          "dom.security.https_only_mode_ever_enabled" = true;
          "extensions.pocket.enabled" = false;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "extensions.formautofill.creditCards.enabled" = false;
          "signon.rememberSignons" = false;
          "signon.generation.enabled" = false;
          "signon.firefoxRelay.feature" = "disabled";
          "signon.management.page.breach-alerts.enabled" = false;

          # Cosmetics
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "browser.urlbar.placeholderName.private" = "DuckDuckGo";

          # Based heavily on Arkenfox user.js (https://github.com/arkenfox/user.js/blob/master/user.js)
          # - Disable about:config warning
          "browser.aboutConfig.showWarning" = false;
          # - Startup
          "browser.startup.page" = 0;
          "browser.startup.homepage" = "about:blank";
          "browser.newtabpage.enabled" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
          # - Geolocation
          "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
          "geo.provider.use_gpsd" = false;
          "geo.provider.use_geoclue" = false;
          # - Quieter Fox
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.shopping.experience2023.enabled" = false;
          # - Telemetry
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.ping-centre.telemetry" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          # - Studies
          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = false;
          # - Crash Reports
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          # - Other
          "captivedetect.canonicalURL" = "";
          "network.captive-portal-service.enabled" = false;
          "network.connectivity-service.enabled" = false;
          # - Safe Browsing
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "network.prefetch-next" = false;
          "network.dns.disablePrefetch" = false;
          "network.predictor.enabled" = false;
          "network.predictor.enable-prefetch" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.places.speculativeConnect.enabled" = false;
          # - DNS / DoH / Proxy / Socks
          "network.proxy.socks_remote_dns" = true;
          "network.file.disable_unc_paths" = true;
          "network.gio.supported-protocols" = "";
          # - Location Bar / Search Bar / Suggestions / History / Forms
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.trending.featureGate" = false;
          "browser.urlbar.addons.featureGate" = false;
          "browser.urlbar.mdn.featureGate" = false;
          "browser.urlbar.pocket.featureGate" = false;
          "browser.urlbar.weather.featureGate" = false;
          "browser.formfill.enable" = false;
          "browser.search.separatePrivateDefault" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          # - Passwords
          "signon.autofillForms" = false;
          "signon.formlessCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          # - Disk Avoidance
          "browser.cache.disk.enable" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "media.memory_cache_max_size" = 65536;
          "browser.sessionstore.privacy_level" = 2;
          "toolkit.winRegisterApplicationRestart" = false;
          "browser.shell.shortcutFavicons" = false;
          # - HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
          "security.ssl.require_safe_negotiation" = true;
          "security.tls.enable_0rtt_data" = false;
          "security.OCSP.enabled" = 1;
          "security.OCSP.require" = true;
          "security.cert_pinning.enforcement_level" = 2;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.pki.crlite_mode" = 2;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_send_http_background_request" = false;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          # - REFERERS
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          # - Plugins / Media / WebRTC
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;
          # - DOM
          "dom.disable_window_move_resize" = true;
          # - Miscellaneous
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.helperApps.deleteTempFileOnExit" = true;
          "browser.uitour.enabled" = false;
          "devtools.debugger.remote-enabled" = false;
          "permissions.manager.defaultsUrl" = "";
          "webchannel.allowObject.urlWhitelist" = "";
          "network.IDN_show_punycode" = true;
          "pdfjs.disabled" = false;
          "pdfjs.enableScripting" = false;
          "browser.tabs.searchclipboardfor.middleclick" = false;
          # - Downloads
          "browser.download.useDownloadDir" = false;
          "browser.download.alwaysOpenPanel" = false;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.always_ask_before_handling_new_types" = true;
          # - Extensions
          "extensions.enabledScopes" = 5;
          "extensions.postDownloadThirdPartyPrompt" = false;
          "browser.contentblocking.category" = "strict";
          # - Shutdown & Sanitizing
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.downloads" = true;
          "privacy.clearOnShutdown.formdata" = true;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.sessions" = true;
          "privacy.clearOnShutdown.cookies" = true;
          "privacy.clearOnShutdown.offlineApps" = true;
          "privacy.cpd.cache" = true;
          "privacy.cpd.formdata" = true;
          "privacy.cpd.history" = true;
          "privacy.cpd.sessions" = true;
          "privacy.cpd.offlineApps" = false;
          "privacy.cpd.cookies" = false;
          "privacy.sanitize.timeSpan" = 0;
          # - Fingerprinting Protection
          "privacy.resistFingerprinting" = true;
          "privacy.window.maxInnerWidth" = 1600;
          "privacy.window.maxInnerHeight" = 900;
          "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "privacy.resistFingerprinting.letterboxing" = true;
          "browser.display.use_system_colors" = false;
          "widget.non-native-theme.enabled" = true;
          "browser.link.open_newwindow" = 3;
          "browser.link.open_newwindow.restriction" = 0;
          "webgl.disabled" = true;
          # - "DON'T TOUCH"
          "extensions.blocklist.enabled" = true;
          "network.http.referer.spoofSource" = false;
          "security.dialog_enable_delay" = 1000;
          "privacy.firstparty.isolate" = false;
          "extensions.webcompat.enable_shims" = true;
          "security.tls.version.enable-deprecated" = false;
          "extensions.webcompat-reporter.enabled" = false;
          "extensions.quarantinedDomains.enabled" = true;
          # - Non-Project Related
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.messaging-system.whatsNewPanel.enabled" = false;
          "browser.urlbar.showSearchTerms.enabled" = true;
        };
      };
    };

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".librewolf" ];
    };
  };
}
