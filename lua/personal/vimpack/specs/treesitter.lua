return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            data = {
                compilers = { "zig", "clang", "gcc" },
                config = {
                    auto_install = true,

                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },

                    indent = {
                        enable = true
                    },
                }
            }
        },
        setup = function()
            local data = vim.pack.get({'nvim-treesitter'})[1].spec.data
            require('nvim-treesitter.install').compilers = data.compilers
            require('nvim-treesitter.config').setup(data.config)
        end
    },
}
