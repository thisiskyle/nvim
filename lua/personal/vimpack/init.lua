pcall(vim.loader.enable)

local specPath = 'personal.vimpack.specs.'
local specDir = vim.fn.stdpath('config') .. '/lua/' .. specPath:gsub('%.', '/')
local files = vim.fn.readdir(specDir)
local specs = {}
local setups = {}

for _, file in ipairs(files) do
    local spec = require(specPath .. file:gsub('%.lua$', ''))
    if(spec.enabled ~= false) then
        if(spec.setup and type(spec.setup) == "function") then
            setups[#setups + 1] = spec.setup
        end
        for _,v in ipairs(spec.specs) do
            specs[#specs + 1] = v
        end
    end
end

vim.pack.add(specs)

for _,v in ipairs(setups) do
    v()
end
