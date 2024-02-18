return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.install').compilers = { "zig", "clang", "gcc" }

            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "vimdoc", "javascript", "typescript", "c",
                    "lua", "sql", "html", "c_sharp",
                    "scss", "python", "css", "bash", "json",
                    "markdown", "markdown_inline", "yaml"
                },

                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
            })
            vim.cmd([[ TSUpdate ]])
        end
    },
}
