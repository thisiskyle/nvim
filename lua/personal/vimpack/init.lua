pcall(vim.loader.enable)


local function collect_pack_data()

    local pack_data = {
        pack_specs = {},
        pack_add = {},
        setups = {}
    }

    local spec_route = 'personal.vimpack.specs.'
    local spec_dir = vim.fn.stdpath('config') .. '/lua/' .. spec_route:gsub('%.', '/')
    local files = vim.fn.readdir(spec_dir)

    for _,file in ipairs(files) do
        local my_spec = require(spec_route .. file:gsub('%.lua$', ''))
        if(my_spec.enabled ~= false) then

            if(my_spec.setup and type(my_spec.setup) == "function") then
                pack_data.setups[#pack_data.setups + 1] = my_spec.setup
            end

            for _,s in ipairs(my_spec.pack_specs) do
                if(not s.src) then
                    if(s.name) then
                        pack_data.pack_add[#pack_data.pack_add + 1] = s.name
                    end
                else
                    pack_data.pack_specs[#pack_data.pack_specs + 1] = s
                end
            end

        end
    end

    return pack_data
end



local function load(data)

    -- load/install vim.pack.Specs normally
    vim.pack.add(data.pack_specs)

    -- load local plugins
    for _,v in ipairs(data.pack_add) do
        vim.cmd(":packadd " .. v)
    end

    -- run all setup functions
    for _,v in ipairs(data.setups) do
        v()
    end

end


-- startup
load(collect_pack_data())



-- extra stuff

local function delete_all()
    local plugins = vim.pack.get()
    local names = {}
    for _,v in ipairs(plugins) do
        names[#names + 1] = v.spec.name
    end
    vim.pack.del(names, { force = true })
end



vim.api.nvim_create_user_command(
    'PackClean',
    function()
        delete_all()
        load(collect_pack_data())
    end,
    {}
)
