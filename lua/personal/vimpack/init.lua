pcall(vim.loader.enable)

local function collect_pack_data()
    local pack_data = {
        specs = {},
        packadd = {},
        setups = {}
    }

    local spec_route = 'personal.vimpack.specs.'

    local spec_dir = vim.fn.stdpath('config') .. '/lua/' .. spec_route:gsub('%.', '/')
    local files = vim.fn.readdir(spec_dir)

    for _, file in ipairs(files) do
        local spec = require(spec_route .. file:gsub('%.lua$', ''))
        if(spec.enabled ~= false) then

            if(spec.setup and type(spec.setup) == "function") then
                pack_data.setups[#pack_data.setups + 1] = spec.setup
            end

            for _,v in ipairs(spec.specs) do
                if(not v.src) then
                    if(v.name) then
                        pack_data.packadd[#pack_data.packadd + 1] = v.name
                    end
                else
                    pack_data.specs[#pack_data.specs + 1] = v
                end
            end

        end
    end
    return pack_data
end


local function install(data)

    vim.pack.add(data.specs)
    for _,v in ipairs(data.packadd) do
        vim.cmd(":packadd " .. v)
    end

    for _,v in ipairs(data.setups) do
        v()
    end
end


local function delete_all()
    local plugins = vim.pack.get()
    local names = {}
    for _,v in ipairs(plugins) do
        names[#names + 1] = v.spec.name
    end
    vim.pack.del(names, { force = true })
end

-- load all the plugins on startup
install(collect_pack_data())

-- user commands
vim.api.nvim_create_user_command(
    'PackClean',
    function()
        delete_all()
        install(collect_pack_data())
    end,
    {}
)
