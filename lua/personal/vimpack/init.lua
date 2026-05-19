pcall(vim.loader.enable)

local config = {
    pack_dir = vim.fn.stdpath('config') .. "/lua/personal/vimpack/packages/",
    pack_list = {
        "anrcy",
        "blink",
        "nvim-lspconfig",
        "nvim-treesitter",
        "rose-pine",
        "snacks",
    }
}


local function get_package_list()
    local files = vim.fn.readdir(config.pack_dir)
    local packages = {}
    for _, file in ipairs(files) do
        local pack = file:gsub('%.lua$', '')
        packages[#packages + 1] = pack
    end
    return packages
end


local function install()
    local plist = config.pack_list or get_package_list()
    for _,v in ipairs(plist) do
        local _path = config.pack_dir .. v .. ".lua"
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


local function delete_package(id)
    local installed = vim.pack.get()
    local delete = {}

    for _,p in ipairs(installed) do
        if((p.spec.data and p.spec.data.pack_id == id) or p.spec.name == id) then
            delete[#delete + 1] = p.spec.name
        end
    end

    vim.pack.del(delete, { force = true })
end


local function delete_inactive()
    local installed = vim.pack.get()
    local delete = {}

    for _,i in ipairs(installed) do
        if(not i.active) then
            delete[#delete + 1] = i.spec.name
        end
    end

    vim.pack.del(delete, { force = true })
end


local function startup()
    if(not config.pack_list) then
        config.pack_list = get_package_list()
    end
    install()
end


vim.api.nvim_create_user_command(
    'Pack',
    function(opts)
        local arg = opts.fargs[1]

        if(arg == 'update') then
            vim.pack.update()

        elseif(arg == 'clean') then
            delete_inactive()

        elseif(arg == 'purge') then
            delete_all()

        elseif(arg == 'sync') then
            delete_inactive()
            install()
            vim.pack.update()

        elseif(arg == 'delete') then
            local pack = opts.fargs[2]
            if(not pack) then
                vim.notify(
                    'Pack delete requires a package name',
                    vim.log.levels.ERROR
                )
            end
            delete_package(pack)

        else
            vim.notify(
                'Invalid command: Pack ' .. arg,
                vim.log.levels.ERROR
            )
        end
    end,
    {
        nargs = '+',
        complete = function(arglead, cmdline)

            local parts = vim.split(cmdline, '%s+')

            if(#parts <= 2) then
                return vim.tbl_filter(
                    function(cmd)
                        return cmd:find(arglead, 1, true) == 1
                    end,
                    {
                        'clean',
                        'purge',
                        'sync',
                        'delete',
                        'update',
                    }
                )
            end

            if(parts[2] == 'delete') then
                local installed = vim.pack.get()
                local tmp = {}
                for _,v in ipairs(installed) do
                    local pack = v.spec.name
                    if(v.spec.data and v.spec.data.pack_id) then
                        pack = v.spec.data.pack_id
                    end
                    tmp[pack] = true
                end
                local list = {}
                for k,_ in pairs(tmp) do
                    list[#list + 1] = k
                end
                return list
            end
        end,
    }
)

startup()
