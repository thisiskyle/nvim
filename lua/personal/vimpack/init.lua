local config = {
    dir = vim.fn.stdpath('config') .. "/lua/personal/vimpack/plugins/",
    enabled = {
        "anrcy",
        "blink",
        "nvim-lspconfig",
        "nvim-treesitter",
        "nvim-undotree",
        "rose-pine",
        "snacks",
    }
}

local function install(opts)
    for _,v in ipairs(opts.enabled) do
        local _path = opts.dir .. v .. ".lua"
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



local function delete_disabled()
    local installed = vim.pack.get()
    local delete = {}

    for _,p in ipairs(installed) do
        for _,f in ipairs(config.enabled) do
            if(p.spec.name == f or (p.spec.data and p.spec.data.pack_id == f)) then
                goto continue
            end
        end

        delete[#delete + 1] = p.spec.name
        ::continue::
    end

    vim.pack.del(delete, { force = true })
end



vim.api.nvim_create_user_command(
    'Pack',
    function(opts)
        local arg = opts.args
        if(arg == 'update') then
            vim.pack.update()
        elseif(arg == 'install') then
            install(config)
        elseif(arg == 'clean') then
            delete_disabled()
        elseif(arg == 'purge') then
            delete_all()
        elseif(arg == 'sync') then
            delete_disabled()
            install(config)
            vim.pack.update()
        else
            vim.notify(
                'Invalid command: Pack ' .. arg,
                vim.log.levels.ERROR
            )
        end
    end, {
        nargs = 1,
        complete = function(arglead)
            return vim.tbl_filter(
                function(cmd)
                    return cmd:find(arglead, 1, true) == 1
                end, {
                    'clean',
                    'install',
                    'purge',
                    'sync',
                    'update',
                }
            )
        end,
    }
)

-- startup
install(config)

