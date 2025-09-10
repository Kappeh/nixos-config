{ config, lib, ... }: {
  options.myModules.applications.media.freetube.enable = lib.mkEnableOption "Enable FreeTube";

  config = lib.mkIf config.myModules.applications.media.freetube.enable {
    programs.freetube = {
      enable = true;
      settings = {
        allowDashAv1Formats = true;
        autoplayVideos = false;
        barColor = false;
        baseTheme = "catppuccinMocha";
        checkForBlogPosts = false;
        checkForUpdates = false;
        defaultQuality = "1080";
        externalLinkHandling = "openLinkAfterPrompt";
        hideHeaderLogo = true;
        hidePopularVideos = true;
        hideTrendingVideos = true;
        listType = "list";
        mainColor = "Blue";
        quickBookmarkTargetPlaylistId = "favourites";
        region = "GB";
        secColor = "Blue";
        useSponsorBlock = true;
      };
    };

    home.persistence."/persist/home/${config.home.username}".files = [
      ".config/FreeTube/playlists.db"
      ".config/FreeTube/profiles.db"
    ];
  };
}
