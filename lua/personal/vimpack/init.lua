pcall(vim.loader.enable)


local function load_all()
    local spec_dir = vim.fn.stdpath('config') .. '/lua/personal/vimpack/plugins/'
    local files = vim.fn.readdir(spec_dir)
    for _,file in ipairs(files) do
        dofile(spec_dir .. file)
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


-- startup
load_all()


-- extra stuff

vim.api.nvim_create_user_command(
    'PackClean',
    function()
        delete_all()
        load_all()
    end,
    {}
)
