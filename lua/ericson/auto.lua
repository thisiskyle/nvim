
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.g.branch_name = require("ericson.utils").set_branch_name()
    end
})


