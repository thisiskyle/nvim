return {
    {
        dir = "~/personal/sleepy",
        enabled = true,
        lazy = false,
        priority = 50,
        opts = {
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
        }
    }
}
