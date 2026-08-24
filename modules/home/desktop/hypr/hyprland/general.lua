require("colors")

hl.config({
    general = {
        border_size = 2,
        layout = "master",
        col = { active_border = { colors = { base0D, base0E }, angle = 135 } },
        col = { inactive_border = { colors = { base03, base02 }, angle = 135 } },
    },
    master = {
        allow_small_split = true,
        mfact = 0.60,
    },
    decoration = {
        blur = { enabled = false },
        shadow = { enabled = false },
    },
    animations = { enabled = true },
    group = {
        -- col = { border_active = { colors = { baseOD, Base0E }, angle = 135 } },
        -- col = { inactive_border = { colors = { base03, base02 }, angle = 135 } },
        groupbar = {
            enabled = true,
            indicator_height = 5,
            render_titles = false,
            rounding = 0,
            gaps_in = 2,
            gaps_out = 2,
            keep_upper_gap = false,
        },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        middle_click_paste = false,
        bell_sound = "none",
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})

