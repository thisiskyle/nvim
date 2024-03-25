return {
    {"ThePrimeagen/vim-be-good"},
    {
        "Eandrju/cellular-automaton.nvim",
        keys = {
            { '<leader>rain', "<cmd>CellularAutomaton make_it_rain<cr>", mode = 'n'},
            { '<leader>scram', "<cmd>CellularAutomaton scramble<cr>", mode = 'n'},
            { '<leader>life', "<cmd>CellularAutomaton game_of_life<cr>", mode = 'n'},
        }
    },
    {
        "ThePrimeagen/vim-apm",
        config = function()
            local apm = require("vim-apm")
            apm:setup({})
        end,
        keys = {
            { '<leader>apm', function()
                local apm = require("vim-apm")
                apm:toggle_monitor()
            end, mode = 'n'},
        }
    }
}
