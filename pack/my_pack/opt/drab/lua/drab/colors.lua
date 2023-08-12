local M = {}

-- color palette
red    = {gui = "#ff0000", term = 9  }
black  = {gui = "#000000", term = 0  }
grey03 = {gui = "#080808", term = 232}
grey07 = {gui = "#121212", term = 233}
grey11 = {gui = "#1c1c1c", term = 234}
grey15 = {gui = "#262626", term = 235}
grey19 = {gui = "#303030", term = 236}
grey23 = {gui = "#3a3a3a", term = 237}
grey27 = {gui = "#444444", term = 238}
grey30 = {gui = "#4e4e4e", term = 239}
grey35 = {gui = "#585858", term = 240}
grey39 = {gui = "#626262", term = 241}
grey42 = {gui = "#6c6c6c", term = 242}
grey46 = {gui = "#767676", term = 243}
grey50 = {gui = "#808080", term = 244}
grey54 = {gui = "#8a8a8a", term = 245}
grey58 = {gui = "#949494", term = 246}
grey62 = {gui = "#9e9e9e", term = 247}
grey66 = {gui = "#a8a8a8", term = 248}
grey70 = {gui = "#b2b2b2", term = 249}
grey74 = {gui = "#bcbcbc", term = 250}
grey78 = {gui = "#c6c6c6", term = 251}
grey82 = {gui = "#d0d0d0", term = 252}
grey85 = {gui = "#dadada", term = 253}
grey89 = {gui = "#e4e4e4", term = 254}
grey93 = {gui = "#eeeeee", term = 255}
white  = {gui = "#ffffff", term = 231}


-- drab
M.default = {
    background = "light",
    fg_normal = black,
    fg_01 = grey70,
    bg_normal = white,
    bg_01 = grey89,
}

-- drab-night
M.night = {
    background = "dark",
    fg_normal = white,
    fg_01 = grey50,
    bg_normal = grey23,
    bg_01 = grey62
}


return M
