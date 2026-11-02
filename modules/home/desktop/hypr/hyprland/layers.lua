local no_anim_rofi = hl.layer_rule({
    name = "no_anim_rofi",
    match = { namespace = "rofi" },
    no_anim = true,
})
no_anim_rofi:set_enabled(true)

