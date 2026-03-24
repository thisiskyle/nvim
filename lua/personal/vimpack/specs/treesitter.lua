local _opts = {
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

return {
    enabled = true,
    specs = {
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            data = _opts
        },
    },
    setup = function()
        require('nvim-treesitter.install').compilers = _opts.compilers
        require('nvim-treesitter.config').setup(_opts.config)
    end
}
