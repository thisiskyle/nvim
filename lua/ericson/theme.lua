
local M = {}


M.themes = {
    cat_light = 1,
    cat_dark = 2,
    cat_transparent = 3,
    rose_light = 4,
    rose_dark = 5,
    rose_transparent = 6,
    drab = 7,
}


local theme_settings = {
    {
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
    {
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
    {
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
    {
        name = 'rose-pine-dawn',
        transparent = false,
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    },
    {
        name = 'rose-pine-moon',
        transparent = false,
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    },
    {
        name = 'rose-pine-moon',
        transparent = true,
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    },
    {
        name = 'drab',
        transparent = false
    }
}

local function set_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = 'none' })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = 'none' })
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


function M.set_theme(index)
    apply_theme(theme_settings[index])
end

function M.pick_random()
    local n = 0
    for i in pairs(M.themes) do
        n = n + 1
    end

    math.randomseed(os.time())
    apply_theme(theme_settings[math.random(1,n)])

end


M.set_theme(M.themes.rose_light)

return M
