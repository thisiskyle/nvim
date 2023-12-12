
local M = {}

local themes = {
    cat_light = {
        name = 'catppuccin',
        transparent = false,
        config = function()
            require("catppuccin").setup({
                flavour = "latte",
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = false,
                no_italic = true,
                no_bold = false,
                no_underline = false,
                integrations = {
                    treesitter = true,
                    markdown = true,
                    cmp = true,
                    which_key = true,
                }
            })
        end
    },
    cat_dark = {
        name = 'catppuccin',
        transparent = false,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = false,
                no_italic = true,
                no_bold = false,
                no_underline = false,
                integrations = {
                    treesitter = true,
                    markdown = true,
                    cmp = true,
                    which_key = true,
                }
            })
        end
    },
    cat_transparent = {
        name = 'catppuccin',
        transparent = true,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = false,
                no_italic = true,
                no_bold = false,
                no_underline = false,
                integrations = {
                    treesitter = true,
                    markdown = true,
                    cmp = true,
                    which_key = true,
                }
            })
        end
    },
    rose_light = {
        name = 'rose-pine',
        transparent = false,
        config = function()
            require("rose-pine").setup({
                variant = 'dawn',
                disable_italics = true,
                disable_background = false,
                disable_float_background = false
            })
        end
    },
    rose_dark = {
        name = 'rose-pine',
        transparent = false,
        config = function()
            require("rose-pine").setup({
                variant = 'moon',
                disable_italics = true,
                disable_background = false,
                disable_float_background = false
            })
        end
    },
    rose_transparent = {
        name = 'rose-pine',
        transparent = true,
        config = function()
            require("rose-pine").setup({
                variant = 'moon',
                disable_italics = true,
                disable_background = true,
                disable_float_background = true
            })
        end
    },
    drab = {
        name = 'drab',
        transparent = false
    }
}

local function set_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
    --vim.api.nvim_set_hl(0, "StatusLine", { bg = 'none' })
    --vim.api.nvim_set_hl(0, "StatusLineNC", { bg = 'none' })
end


local function apply_theme(_theme)
    if _theme.config then
        _theme.config()
    end

    vim.cmd.colorscheme(_theme.name)

    if(_theme.transparent) then
        set_transparent()
    end
end


function M.set_theme(name)
    apply_theme(themes[name])
end

function M.pick_random()
    -- count number of themes
    local n = 0
    for i in pairs(themes) do
        n = n + 1
    end

    -- generate random number
    math.randomseed(os.time())
    local rand = math.random(1,n)

    -- find the key for the number and set theme
    n = 0
    for k in pairs(themes) do
        if(n == rand) then
            apply_theme(themes[k])
        end
        n = n + 1
    end
end

return M
