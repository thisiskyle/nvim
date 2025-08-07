return {
    enabled = true,
    sources = {
        "https://github.com/thisiskyle/sleepy-nvim"
    },
    setup = function()
        require("sleepy").setup({
            global_after = function()
                vim.cmd(":%!jq")
            end,
            animation = "default",
            custom_animations = {
                spin = {
                    delta_time_ms = 50,
                    frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                },
                catch = {
                    delta_time_ms = 125,
                    frames = { "--(o  )-", "-(  o )-", "-(   o)-", "-(    o)", "-(  o)--", "-( o  )-", "-(o   )-", "(o    )-", }
                },
            }
        })


        vim.keymap.set(
            { 'v' },
            '<leader>nn',
            ":Sleepy<cr>",
            { desc = 'sleepy: run' }
        )


        vim.keymap.set(
            { 'n' },
            '<leader>na',
            ":SleepyAnimate<cr>",
            { desc = 'sleepy: run animation test' }
        )

    end
}
