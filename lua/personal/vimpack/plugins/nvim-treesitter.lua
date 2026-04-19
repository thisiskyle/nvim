if(vim.fn.has("win32") == 1) then
    return
end


vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", },
}, { confirm = false })


require('nvim-treesitter').install({
    'bash',
    'c_sharp',
    'cpp',
    'git_config',
    'gitcommit',
    'gitignore',
    'lua',
    'markdown',
    'typescript',
    'vim',
})


require("nvim-treesitter-textobjects").setup({
    select = {
        enable = true,
        lookahead = true,
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function(e)
        require('nvim-treesitter').install(e.match)
    end
})


vim.keymap.set(
    { "x", "o" },
    "af",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end
)

vim.keymap.set(
    { "x", "o" },
    "if",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end
)
