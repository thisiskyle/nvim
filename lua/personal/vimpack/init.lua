pcall(vim.loader.enable)

local specPath = 'personal.vimpack.specs.'
local specDir = vim.fn.stdpath('config') .. '/lua/' .. specPath:gsub('%.', '/')
local files = vim.fn.readdir(specDir)
local specs = {}

for _, file in ipairs(files) do
    local spec = require(specPath .. file:gsub('%.lua$', ''))
    if(spec.enabled ~= false) then
        for _,v in ipairs(spec.specs) do
            specs[#specs + 1] = v
        end
    end
end

vim.pack.add(specs)

for _,v in ipairs(specs) do
    if(v.data and type(v.data.setup) == "function") then
        v.data.setup()
    end
end
