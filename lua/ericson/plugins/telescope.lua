
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim'
        },
        config = function()
            -- this function is for opening multiple files at once
            local select_one_or_multi = function(prompt_bufnr)
                local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
                local multi = picker:get_multi_selection()
                if not vim.tbl_isempty(multi) then
                    require('telescope.actions').close(prompt_bufnr)
                    for _, j in pairs(multi) do
                        if j.path ~= nil then
                            vim.cmd(string.format("%s %s", "edit", j.path))
                        end
                    end
                else
                    require('telescope.actions').select_default(prompt_bufnr)
                end
            end

            local ts = require('telescope')
            local tsundo = require('telescope-undo.actions')

            ts.setup({
                defaults = {
                    file_ignore_patterns = {
                        "tags",
                        "node_modules",
                        ".git\\",
                        "Library",
                        "%.meta",
                        "%.unity",
                        "%.asset",
                        "%.anim",
                        "%.png",
                        "%.asset"
                    },
                    mappings = {
                        i = {
                            ["<CR>"] = select_one_or_multi,
                        }
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                },
                extensions = {
                    undo = {
                        mappings = {
                            i = {
                                ["<C-a>"] = tsundo.yank_additions,
                                ["<C-d>"] = tsundo.yank_deletions,
                                ["<cr>"] = tsundo.restore,
                            },
                            n = {
                                ["ya"] = tsundo.yank_additions,
                                ["yd"] = tsundo.yank_deletions,
                                ["<cr>"] = tsundo.restore,
                            }
                        }
                    }
                }
            })

            require('telescope').load_extension('undo');

        end,
        keys = {
            { '<leader>ff', "<cmd>Telescope find_files<cr>", mode = 'n'},
            { '<leader>fg', "<cmd>Telescope live_grep<cr>", mode = 'n'},
            { '<leader>fh', "<cmd>Telescope help_tags<cr>", mode = 'n'},
            { '<leader>fw', "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", mode = 'n'},
            { '<leader>fr', "<cmd>Telescope lsp_references<cr>", mode = 'n'},
            { '<leader>fi', "<cmd>Telescope lsp_implementations<cr>", mode = 'n'},
            { '<leader>fu', "<cmd>Telescope undo<cr>", mode = 'n'},
        }
    },
}
