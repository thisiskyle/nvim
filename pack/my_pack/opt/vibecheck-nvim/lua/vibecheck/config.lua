-- config

local M = {
    -- path to the save file
    save_file = vim.fn.stdpath("data") .. "/.vibecheck",
    -- startup method: "default" "last" "random"
    startup = "default",
    -- the default vibe to be set when startup = "default"
    default_vibe = "default",
    -- table of colorscheme configs (vibes)
    vibes = {
        ---- example
        --tokyonight = {
        --    colorscheme = 'tokyonight',
        --    background = 'dark',
        --    config = function()
        --        -- colorscheme specific config
        --        require("tokyonight").setup({
        --            style = "storm",
        --            transparent = false,
        --            terminal_colors = true,
        --            styles = {
        --                comments = { italic = true },
        --                keywords = { italic = false },
        --                functions = { italic = false },
        --                variables = { italic = false },
        --                sidebars = "dark",
        --                floats = "dark",
        --            },
        --            on_highlights = function(hl, c)
        --                hl.EndOfBuffer = { link = "Comment" }
        --            end,
        --        })
        --    end,
        --    -- runs after the vibe is set
        --    after = function()
        --        vim.opt.fillchars = "eob:~"
        --    end
        --},
    },
}


--- Merges the default config with a config provided by the user
--- @param _config any
---
function M.setup(_config)
    for k,v in pairs(_config) do
        M[k] = v
    end

end

return M
