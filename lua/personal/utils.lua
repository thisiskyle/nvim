local M = {}

function M.set_global_gitbranch()
    vim.g.gitbranch = vim.fn.trim(vim.fn.system("git branch --show-current"))
    if(string.find(vim.g.gitbranch, "fatal", 1, true)) then
        vim.g.gitbranch = "[NONE]"
    end
end

function M.open_scratchpad()
    local name = "scratch_pad"
    if(vim.fn.bufexists(name) == 0) then
        vim.cmd(":enew")
        vim.cmd(":file " .. name)
    else
        vim.cmd(":b " .. name) end
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "hide"
    vim.opt_local.filetype = "markdown"
    vim.opt_local.swapfile = false
end

return M
