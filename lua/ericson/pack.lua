local requirePath = 'ericson.pack.'

local filePath = vim.fn.stdpath('config') .. '/lua/' .. requirePath:gsub('%.', '/')
local files = vim.fn.readdir(filePath)

for _, file in ipairs(files) do
    local pack = require(requirePath .. file:gsub('%.lua$', ''))
    if(pack.enabled ~= false) then
        vim.pack.add(pack.sources)
        if(pack.setup) then
            pack.setup()
        end
    end
end
