return {
    enabled = true,
    sources = {
        'https://github.com/neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    setup = function()

        require('mason').setup()
        require('mason-lspconfig').setup({ automatic_enable = true })

        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
            signs = false,
            underline = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "single",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        vim.keymap.set(
            { 'n' },
            '<leader>ld',
            function()
                vim.lsp.buf.definition()
            end,
            { desc = 'lsp: go to definition' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>lt',
            function()
                vim.lsp.buf.type_definition()
            end,
            { desc = 'lsp: go to type definition' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>lf',
            function()
                vim.lsp.buf.hover()
            end,
            { desc = 'lsp: open float' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>df',
            function()
                vim.diagnostic.open_float()
            end,
            { desc = 'diagnostic: open float' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>dq',
            function()
                vim.diagnostic.setqflist()
            end,
            { desc = 'diagnostic: quickfix' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>dl',
            function()
                vim.diagnostic.setloclist()
            end,
            { desc = 'diagnostic: local list' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>dn',
            function()
                vim.diagnostic.goto_next()
            end,
            { desc = 'diagnostic: go to next' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>dp',
            function()
                vim.diagnostic.goto_prev()
            end,
            { desc = 'diagnostic: go to prev' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>ds',
            function()
                vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
            end,
            { desc = 'diagnostic: turn on virtual text' }
        )

        vim.keymap.set(
            { 'n' },
            '<leader>dh',
            function()
                vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
            end,
            { desc = 'diagnostic: turn off virtual text' }
        )
    end
}
