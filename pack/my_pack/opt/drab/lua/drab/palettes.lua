local M = {}

M.list = {

    main = {
        background = "light",
        -- text
        text = {gui = "#000000"},
        alt = {gui = "#000000"},
        muted = {gui = "#b2b2b2"},
        -- backgrounds
        base = {gui = "#ffffff"},
        highlight = {gui = "#e4e4e4"},
        accent = {gui = "#e4e4e4"},
        -- other
        error = {gui = "#eb6f92"},
        warn = {gui = "#f6c177"},
        info = {gui = "#3e8fb0"},
        hint = {gui = "#c4a7e7"},
        ok = {gui = "#9ccfd8"},
    },

    day = {
        background = "light",
        -- text
        text = {gui = "#000000"},
        alt = {gui = "#000000"},
        muted = {gui = "#b2b2b2"},
        -- backgrounds
        base = {gui = "#ffffff"},
        highlight = {gui = "#e4e4e4"},
        accent = {gui = "#e4e4e4"},
        -- diag
        error = {gui = "#eb6f92"},
        warn = {gui = "#f6c177"},
        info = {gui = "#3e8fb0"},
        hint = {gui = "#c4a7e7"},
        ok = {gui = "#9ccfd8"},
    },

    night = {
        background = "dark",
        -- text
        text = {gui = "#ffffff"},
        alt = {gui = "#ffffff"},
        muted = {gui = "#808080"},
        -- backgrounds
        base = {gui = "#000000"},
        highlight = {gui = "#3a3a3a"},
        accent = {gui = "#3a3a3a"},
        -- other
        error = {gui = "#eb6f92"},
        warn = {gui = "#f6c177"},
        info = {gui = "#3e8fb0"},
        hint = {gui = "#c4a7e7"},
        ok = {gui = "#9ccfd8"},
    },
}

return M
