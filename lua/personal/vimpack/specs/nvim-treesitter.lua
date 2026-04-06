local _opts = {
	languages = { 'lua', 'typescript', 'bash' },
	compilers = { "gcc", "zig" }
}

return {
    enabled = false,
    specs = {
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            data = _opts
        },
    },
    setup = function()
        require('nvim-treesitter.install').compilers = _opts.compilers
        require('nvim-treesitter').install(_opts.languages)
    end
}
