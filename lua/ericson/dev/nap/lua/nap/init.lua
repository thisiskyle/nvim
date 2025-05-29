
require("nap.commands")
local utils = require("nap.utils")
local ui = require("nap.ui")
local request_handler = require("nap.request_handler")

M = {}

-- todo: setup? maybe?
function M.setup()
end

-- todo: we should do a progress notification so the user knows 
--       its still running when we make async calls
--
-- todo: I think the request handler needs another name
-- todo: maybe abstract out these function to another layer so we don't do too much logic in here

function M.test_and_show()
    local requests = utils.get_visual_selection_as_lua()
    request_handler.async(requests, function(responses)
        ui.show_test_results(request_handler.run_tests(responses))
    end)
end

function M.request_and_show()
    local requests = utils.get_visual_selection_as_lua()
    request_handler.async(requests, function(responses)
            ui.show(responses)
    end)
end

return M
