hl.on("hyprland.start", function ()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-clip-persist --clipboard regular --write-timeout 1000")
end)

