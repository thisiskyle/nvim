local M = {}

local diag_active = true;


function M.toggle_diagnostics()
    diag_active = not diag_active
    if(diag_active) then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
        vim.opt.signcolumn = "no"
    end
end

function M.vimgrep()
    vim.cmd.vimgrep(vim.fn.input("vimgrep > ") .. " ./**/*")
    vim.cmd.vimgrep("Telescope quickfix")
end

function M.open_scratch_pad()
    vim.cmd(":enew")
    vim.cmd(":file scratch")
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "hide"
    vim.opt_local.swapfile = false
end


function M.set_branch_name()
	local branch = vim.fn.system("git branch --show-current")

    if(string.find(branch, 'fatal')) then
        branch = ""
    end

	if branch ~= "" then
		return "  " .. branch:gsub('\n', '') .. "  |"
	else
		return ""
	end
end

function M.GitBranch()
    return vim.b.branch_name
end

return M
