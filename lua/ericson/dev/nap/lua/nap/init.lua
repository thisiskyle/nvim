
require("nap.commands")
local utils = require("nap.utils")
local ui = require("nap.ui")
local job_handler = require("nap.job.job_handler")

M = {}

-- todo: setup? maybe?
function M.setup()
    M.config = {}
end

function M.use_selection()
    local jobs = utils.get_visual_selection_as_lua()
    job_handler.async(jobs, function(responses)
        ui.show(responses)
    end)
end

return M
