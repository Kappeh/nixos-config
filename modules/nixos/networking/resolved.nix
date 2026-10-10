{
  config.services.resolved = {
    enable = true;
    # Disable fallback dns server, only use the primary dns server
    settings.Resolve.fallbackDns = [];
  };
}

