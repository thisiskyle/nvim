
require("sleepy.commands")
local config = require("sleepy.config")

M = {}


function M.setup(opts)
    config.setup(opts)
end

function M.use_selection()
    local jobs = require("sleepy.utils").get_visual_selection_as_lua()
    if(jobs == nil) then
        vim.notify("Job list is nil", vim.log.levels.ERROR)
        return
    end
    require("sleepy.job_handler").async(jobs, M.config, function(responses)
        require("sleepy.ui").show(responses)
    end)
end

return M
