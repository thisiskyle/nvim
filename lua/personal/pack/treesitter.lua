return {
    enabled = true,
    sources = {
        "https://github.com/nvim-treesitter/nvim-treesitter",
    },

    setup = function()
        require('nvim-treesitter.install').compilers = { "zig", "clang", "gcc" }
        require('nvim-treesitter.configs').setup({
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
