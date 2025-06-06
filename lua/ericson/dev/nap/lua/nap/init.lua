
require("nap.commands")
local utils = require("nap.utils")
local ui = require("nap.ui")
local request_handler = require("nap.request_handler")

M = {}



-- todo: setup? maybe?
function M.setup()
    M.config = {}
end

-- todo: I think the request handler needs another name
-- todo: actually, maybe what we should have is a job handler that can handle different jobs
-- todo: maybe abstract out these function to another layer so we don't do too much logic in here

function M.test_using_selection()
    local jobs = utils.get_visual_selection_as_lua()
    request_handler.async(jobs, function(responses)
        ui.show_test_results(request_handler.run_tests(responses))
    end)
end

function M.request_using_selection()
    local jobs = utils.get_visual_selection_as_lua()
    request_handler.async(jobs, function(responses)
        ui.show(responses)
    end)
end

return M
