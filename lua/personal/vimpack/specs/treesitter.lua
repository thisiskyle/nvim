return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            data = {
                setup = function()
                    require('nvim-treesitter.install').compilers = { "zig", "clang", "gcc" }
                    require('nvim-treesitter.config').setup({
                        auto_install = true,

                        highlight = {
                            enable = true,
                            additional_vim_regex_highlighting = false,
                        },

                        indent = {
                            enable = true
                        },
                    })
                end
            }
        }
    },
}
