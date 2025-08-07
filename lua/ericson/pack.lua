
local configPath = vim.fn.stdpath('config') .. '/lua/ericson/pack/'
local files = vim.fn.readdir(configPath)

for _, file in ipairs(files) do
    local pack = require('ericson.pack.' .. file:gsub('%.lua$', ''))
    if(pack.enabled and pack.enabled ~= false) then
        vim.pack.add({ pack.src })
        if(pack.setup) then
            pack.setup()
        end
    end
end
