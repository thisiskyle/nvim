local ts = "https://github.com/nvim-treesitter/nvim-treesitter"
local ts_to = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
local _pack_id = "nvim-treesitter"

local parsers = {
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
}

if(vim.fn.has("win32") == 1) then

	vim.pack.add({
		{
            src = ts,
            version = "master",
        },
		{
            src = ts_to,
            data = { pack_id = _pack_id }
        }
	}, { confirm = false })

	require('nvim-treesitter.install').compilers = { "zig" }
	require('nvim-treesitter.configs').setup({
        parser_install_dir = vim.fn.stdpath("data") .. "/site",
		ensure_installed = parsers,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true
		},
	})

else

	vim.pack.add({
		{
            src = ts,
        },
		{
            src = ts_to,
            data = { pack_id = _pack_id }
        }
	}, { confirm = false })

	require('nvim-treesitter').install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function(e)
            require('nvim-treesitter').install(e.match)
        end
    })

end


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

