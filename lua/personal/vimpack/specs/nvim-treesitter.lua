local _opts = {
	languages = { 'lua', 'typescript', 'bash' },
}

local on_windows = vim.fn.has("win32") == 1

return {
    enabled = not on_windows,
    specs = {
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            data = _opts
        },
    },
    setup = function()
        require('nvim-treesitter').install(_opts.languages)
    end
}
