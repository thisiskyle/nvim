local pack_dir = vim.fn.stdpath('config') .. "/lua/personal/vimpack/packages/"

local pack_list = {
    "anrcy",
    "blink",
    "nvim-lspconfig",
    "nvim-undotree",
    "nvim-treesitter",
    "rose-pine",
    "snacks",
}


local function install_all()
    for _,v in ipairs(pack_list) do
        local _path = pack_dir .. v .. ".lua"
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
        if((p.spec.data and p.spec.data.pack_id == id)) then
            delete[#delete + 1] = p.spec.name
        end
    end

    vim.pack.del(delete, { force = true })
end



local function delete_disabled()
    local installed = vim.pack.get()
    local delete = {}

    for _,p in ipairs(installed) do
        for _,f in ipairs(pack_list) do
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
        local arg = opts.fargs[1]

        if(arg == 'update') then
            vim.pack.update()

        elseif(arg == 'install_all') then
            install_all()

        elseif(arg == 'clean') then
            delete_disabled()

        elseif(arg == 'purge') then
            delete_all()

        elseif(arg == 'sync') then
            delete_disabled()
            install_all()
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
    end, {
    nargs = '+',
    complete = function(arglead, cmdline)

        local parts = vim.split(cmdline, '%s+')

        if(#parts <= 2) then
            return vim.tbl_filter(
                function(cmd)
                    return cmd:find(arglead, 1, true) == 1
                end, {
                'clean',
                'install_all',
                'purge',
                'sync',
                'delete',
                'update',
            }
        )
    end

    if(parts[2] == 'delete') then
        return pack_list
    end

end,
    }
)


-- startup
install_all()

