hl.curve("default", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "layers", enabled = false })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default", style = "slidefade 20%" })

