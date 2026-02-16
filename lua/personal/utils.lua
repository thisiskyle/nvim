local M = {}

function M.gitbranch()
    vim.g.gitbranch = vim.fn.trim(vim.fn.system("git branch --show-current"))
    if(string.find(vim.g.gitbranch, "fatal", 1, true)) then
        vim.g.gitbranch = "[NONE]"
    end
end

function M.git_run(opts)
    M.open_scratchpad()
    vim.cmd("read !git " .. table.concat(opts.fargs, " "))
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

function M.Color_Me(conf)
    local c = conf.color or "default"
    vim.cmd.colorscheme(c)

    if(conf.transparent == nil) then
        if(vim.g.transparentBg == nil) then
            vim.g.transparentBg = false
        end
    else
        vim.g.transparentBg = conf.transparent
    end

    if(vim.g.transparentBg) then
        vim.opt.background = "dark"
        vim.cmd.colorscheme(vim.g.colors_name)
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end

end


return M
