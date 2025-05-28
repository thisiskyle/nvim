require("nap.commands")
local utils = require("nap.utils")
local buffer = require("nap.buffer")
local request_handler = require("nap.request_handler")

M = {}

-- todo: setup? maybe?
function M.setup()
end

-- todo: we should do a progress notification so the user knows 
--       its still running when we make async calls

function M.test_and_show()
    -- local requestJob = utils.get_visual_selection_as_lua()
    -- request_handler.async(requestJob, function(responses)
    --     local results = request_handler.run_tests(responses)
    --     buffer.display_test_results(results)
    -- end)
end

function M.request_and_show()
    local requestJob = utils.get_visual_selection_as_lua()

    -- local responses = request_handler.sync(requestJob)
    -- for _,v in pairs(responses) do
    --     print(v.name)
    --     buffer.display_response(v)
    --     if(v.after) then
    --         v.after(v.response)
    --     end
    -- end

    request_handler.async(requestJob, function(responses)
        for _,v in pairs(responses) do
            print(v.name)
            buffer.display_response(v)
            if(v.after) then
                v.after(v.response)
            end
        end
    end)

end

return M
