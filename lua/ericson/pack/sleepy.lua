return {
    src = "https://github.com/thisiskyle/sleepy-nvim",
    enabled = true,
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
    end
}
