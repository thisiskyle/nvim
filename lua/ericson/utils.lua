local M = {}

function M.open_scratch_pad()
    vim.cmd(":enew")
    vim.cmd(":file scratch")
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "hide"
    vim.opt_local.filetype = "markdown"
    vim.opt_local.swapfile = false
end

function M.set_branch_name()
	local branch = vim.fn.system("git branch --show-current")

    if(string.find(branch, 'fatal')) then
        branch = ""
    end

	if branch ~= "" then
		return branch:gsub('\n', '')
	else
		return ""
	end
end

function M.git_branch()
    return vim.g.branch_name
end

function M.toggle_status()
    local num = vim.opt.laststatus:get()
    vim.opt.laststatus = (num % 2) + 1
end


function M.diag_count()
    if vim.fn.has('nvim-0.6') == 1 then
      -- On nvim 0.6+ use vim.diagnostic to get lsp generated diagnostic count.
      local diagnostics = vim.diagnostic.get(0)
      local count = { 0, 0, 0, 0 }
      for _, diagnostic in ipairs(diagnostics) do
        if vim.startswith(vim.diagnostic.get_namespace(diagnostic.namespace).name, 'vim.lsp') then
          count[diagnostic.severity] = count[diagnostic.severity] + 1
        end
      end

      local return_value = ""

      local e = count[vim.diagnostic.severity.ERROR]
      local w = count[vim.diagnostic.severity.WARN]
      local i = count[vim.diagnostic.severity.INFO]
      local h = count[vim.diagnostic.severity.HINT]

      if(e > 0) then return_value = return_value .. "E:" .. e .. " " end
      if(w > 0) then return_value = return_value .. "W:" .. w .. " " end
      if(i > 0) then return_value = return_value .. "I:" .. i .. " " end
      if(h > 0) then return_value = return_value .. "H:" .. h .. " " end

      return return_value

    end
end

return M
