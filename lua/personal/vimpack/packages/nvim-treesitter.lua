if(vim.fn.has("win32") ~= 1) then

    local _pack_id = (debug.getinfo(1, "S").source):match("([^@/\\]+)%.lua$")

    vim.pack.add({
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            data = { pack_id = _pack_id }
        },
    }, { confirm = false })


    local ts = require("nvim-treesitter")

    ts.install({
        'lua',
        'vim',
        'angular'
    })


    -- auto install
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function(e)
            require('nvim-treesitter').install(e.match)
        end
    })

    -- start treesitter
    vim.api.nvim_create_autocmd('FileType', {
        pattern = vim.tbl_deep_extend("force", ts.get_installed(), {
            "htmlangular"
        }),
        callback = function()
            vim.treesitter.start()
        end
    })

end
