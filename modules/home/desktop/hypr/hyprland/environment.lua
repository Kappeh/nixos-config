-- XDG Specification
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Run SDL2 applications on Wayland. Remove or set to `x11` if games that provide
-- older versions of SDL cause compatibility issues.
hl.env("SDL_VIDEODRIVER", "wayland")

-- Clutter package already has Wayland enabled, this variable will force Clutter
-- applications to try and use Wayland backend.
hl.env("CLUTTER_BACKEND", "wayland")

-- Electron
hl.env("NIXOS_OZONE_WL", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- GTK Variables
--
-- GTK: Use Wayland if available; if not, try X11 and then any other GDK backend.
hl.env("GDK_BACKEND", "wayland,x11,*")
-- Set a GTK theme manually, for those who want to avoid appearance tools such
-- as lxappearance or nwg-look.
-- hl.env("GTK_THEME", "")
-- Set your cursor theme. The theme needs to be installed and readable by your user.
-- hl.env("XCURSOR_THEME", "")
-- Set cursor size. See [here](https://wiki.hypr.land/FAQ) for why you might want
-- this variable set.
-- hl.env("XCURSOR_SIZE", "")

-- Qt Variables
--
-- Enables automatic scaling, based on the monitor's pixel density.
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
-- Tell Qt applications to use the Wayland backend, and fall back to X11 if
-- Wayland is unavailable.
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- Disables window decorations on Qt applications.
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
-- Tells Qt based applications to pick your theme from qt6ct, use with Kvantum.
-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Nvidia Specific
--
-- Force GBM as backend.
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- Hardware acceleration on Nvidia GPUs
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
