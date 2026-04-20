pcall(vim.loader.enable)

local function load()
    local path = vim.fn.stdpath('config') .. "/lua/personal/vimpack/plugins/"

    local enabled = {
        "anrcy",
        "blink",
        "nvim-lspconfig",
        "nvim-treesitter",
        "nvim-undotree",
        "rose-pine",
        "snacks",
    }

    for _,v in ipairs(enabled) do
        local _path = path .. v .. ".lua"
        if(vim.fn.filereadable(_path) == 1) then
            dofile(_path)
        end
    end

end


local function delete_all()
    local installed = vim.pack.get()
    local names = {}
    for _,v in ipairs(installed) do
        names[#names + 1] = v.spec.name
    end
    vim.pack.del(names, { force = true })
end


-- startup
load()


-- extra stuff


vim.api.nvim_create_user_command(
    'Pack',
    function(opts)
        local arg = opts.args

        if(arg == 'update') then
            vim.pack.update()

        elseif(arg == 'clean') then
            delete_all()
            load()

        elseif(arg == 'purge') then
            delete_all()

        else
            vim.notify(
                'Invalid command: Pack ' .. arg,
                vim.log.levels.ERROR
            )
        end
    end,
    {
        nargs = 1,
        complete = function(arglead)
            local cmds = { 'update', 'clean', 'purge' }
            return vim.tbl_filter(function(cmd)
                return cmd:find(arglead, 1, true) == 1
            end, cmds)
        end,
    }
)
