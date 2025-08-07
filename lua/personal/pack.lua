local requirePath = 'personal.pack.'

local spec = vim.fn.stdpath('config') .. '/lua/' .. requirePath:gsub('%.', '/')
local files = vim.fn.readdir(spec)

local sources = {}
local setups = {}

-- sort all the sources and setups into their own arrays
for _, file in ipairs(files) do
    local pack = require(requirePath .. file:gsub('%.lua$', ''))
    if(pack.enabled ~= false) then
        for _,v in ipairs(pack.sources) do
            table.insert(sources, v)
        end
        if(pack.setup) then
            table.insert(setups, pack.setup)
        end
    end
end

-- install all sources
vim.pack.add(sources)

-- run all setups
for _,v in ipairs(setups) do
    v()
end



