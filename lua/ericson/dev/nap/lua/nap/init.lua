require("nap.commands")
local utils = require("nap.utils")
local job_handler = require("nap.job_handler")

M = {}

-- todo:
function M.setup()
end

function M.test()
    local jobData = utils.get_visual_selection_as_lua()
    job_handler.run_and_test(jobData)
end


function M.display()
    local jobData = utils.get_visual_selection_as_lua()
    job_handler.run_and_display(jobData)

end


function M.get(jobs)
    if(utils.is_array(jobs) == false) then
        return job_handler.run_and_get({ jobs })
    end

    return job_handler.run_and_get(jobs)
end

return M
