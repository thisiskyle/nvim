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

            require('telescope').setup {
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
                                ["<C-a>"] = require("telescope-undo.actions").yank_additions,
                                ["<C-d>"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            },
                            n = {
                                ["ya"] = require("telescope-undo.actions").yank_additions,
                                ["yd"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            }
                        }
                    }
                }
            }

            require('telescope').load_extension('undo');
        end
    },
}
