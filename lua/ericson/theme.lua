
local M = {}



M.themes = {

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
        name = 'rose-pine-dawn',
        transparent = false,
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    },
    rose_dark = {
        name = 'rose-pine-moon',
        transparent = false,
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    },

    rose_transparent = {
        name = 'rose-pine-moon',
        transparent = true,
        config = function()
            require("rose-pine").setup({
                disable_italics = true
            })
        end
    }
}



function M.set_theme(_theme)

    if _theme.config then
        _theme.config()
    end

    vim.cmd.colorscheme(_theme.name)

    if(_theme.transparent) then
        M.set_transparent()
    end

end


function M.set_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = 'none' })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = 'none' })
end



M.set_theme(M.themes.cat_light)

return M
