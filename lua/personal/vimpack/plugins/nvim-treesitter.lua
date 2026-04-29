if(vim.fn.has("win32") ~= 1) then

    vim.pack.add({
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
        },
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
            data = { pack_id = "nvim-treesitter" }
        }
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
        'markdown_inline',
        'typescript',
        'vim',
    })


    vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function(e)
            require('nvim-treesitter').install(e.match)
        end
    })


    require("nvim-treesitter-textobjects").setup({
        select = {
            enable = true,
            lookahead = true,
        },
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


end
