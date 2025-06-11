
require("nap.commands")

M = {}

-- todo:
function M.setup()
    M.config = {}
end

function M.use_selection()
    local jobs = require("nap.utils").get_visual_selection_as_lua()
    if(jobs == nil) then
        vim.notify("Job list is nil", vim.log.levels.ERROR)
        return
    end
    require("nap.job_handler").async(jobs, function(responses)
        require("nap.ui").show(responses)
    end)
end

return M
