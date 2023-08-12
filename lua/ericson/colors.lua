

function ColorTheThings(opts)

    options = opts or {}
    color = options.color or "drab"
    transparent = options.tp or false

    vim.cmd.colorscheme(color)

    if(transparent) 
    then
        vim.opt.background = "dark"
        vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = 'none' })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = 'none' })
    end

end


ColorTheThings()
