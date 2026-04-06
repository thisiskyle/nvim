pcall(vim.loader.enable)

local function collect_pack_data()
    local data = {
        specs = {},
        setups = {}
    }
    local spec_route = 'personal.vimpack.specs.'

    local spec_dir = vim.fn.stdpath('config') .. '/lua/' .. spec_route:gsub('%.', '/')
    local files = vim.fn.readdir(spec_dir)

    for _, file in ipairs(files) do
        local spec = require(spec_route .. file:gsub('%.lua$', ''))
        if(spec.enabled ~= false) then
            if(spec.setup and type(spec.setup) == "function") then
                data.setups[#data.setups + 1] = spec.setup
            end
            for _,v in ipairs(spec.specs) do
                data.specs[#data.specs + 1] = v
            end
        end
    end
    return data
end

local function install(data)
    vim.pack.add(data.specs)
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
vim.cmd(":packadd nvim.undotree")


-- user commands
vim.api.nvim_create_user_command(
    'PackClean',
    function()
        delete_all()
        install(collect_pack_data())
    end,
    {}
)
