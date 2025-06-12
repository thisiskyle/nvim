return {
    {
        dir = vim.fn.stdpath("config") .. "/lua/ericson/dev/sleepy",
        enabled = true,
        lazy = false,
        priority = 50,
        opts = {
            -- animation = "worm",
            custom_animations = {
                spin = {
                    speed = 80,
                    frames = {
                        "⠋",
                        "⠙",
                        "⠹",
                        "⠸",
                        "⠼",
                        "⠴",
                        "⠦",
                        "⠧",
                        "⠇",
                        "⠏"
                    }
                },
                catch = {
                    speed = 150,
                    frames = {
                        "--(o  )-",
                        "-(  o )-",
                        "-(   o)-",
                        "-(    o)",
                        "-(  o)--",
                        "-( o  )-",
                        "-(o   )-",
                        "(o    )-",
                    }
                },

                worm = {
                    speed = 400,
                    frames = {
                        "|-  |",
                        "|^  |",
                        "| - |",
                        "| ^ |",
                        "|  -|",
                        "|  ^|",
                        "| - |",
                        "| ^ |",
                    }
                },
            }
        }
    }
}
