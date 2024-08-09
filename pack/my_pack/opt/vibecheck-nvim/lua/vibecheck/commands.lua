vim.api.nvim_create_user_command(
    'VibeCheck',
    function(tabl)
        require("vibecheck").vibe_check(tabl.args)
    end,
    {
        nargs = 1,
        complete = function()
            local i = 0
            local r = {}
            for k,_ in pairs(require("vibecheck").config.vibes) do
                i = i + 1
                r[i] = k
            end
            return r
        end
    }
)

vim.api.nvim_create_user_command(
    'VibeRandom',
    function()
        require("vibecheck").random()
    end,
    { }
)
