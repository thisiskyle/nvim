return {
    {
        "mistweaverco/kulala.nvim",
        enabled = false,
        opts = { },
        keys = {
            {
                "<leader>rs",
                mode = { 'n' },
                desc = "kulala: send request",
                function()
                    require("kulala").run()
                end,
            },
            {
                "<leader>ra",
                mode = { 'n' },
                desc = "kulala: send all request",
                function()
                    require("kulala").run_all()
                end,
            },
        },
    },
}
