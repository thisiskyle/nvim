local specPath = 'personal.vimpack.specs.'

local specDir = vim.fn.stdpath('config') .. '/lua/' .. specPath:gsub('%.', '/')
local files = vim.fn.readdir(specDir)

local specs = {}

-- sort all the specs
for _, file in ipairs(files) do
    local spec = require(specPath .. file:gsub('%.lua$', ''))
    if(spec.enabled ~= false) then
        for _,v in ipairs(spec.specs) do
            table.insert(specs, v)
        end
    end
end

-- install all sources
vim.pack.add(specs)

-- run all setups
for _,v in ipairs(vim.pack.get()) do
    if(v.spec.data and type(v.spec.data.setup) == "function") then
        v.spec.data.setup()
    end
end
