local M = {}

function M.gitbranch()
    vim.g.gitbranch = vim.fn.trim(vim.fn.system("git branch --show-current"))
    if(string.find(vim.g.gitbranch, "fatal", 1, true)) then
        vim.g.gitbranch = "[NONE]"
    end
end

function M.lsp_clients()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if(#clients == 0) then
        return "No active client"
    end
    return clients[1].name
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

function M.statusline(l, s)
    local style = s or {
        labelHl = "%#Visual#",
        contentHl = "%#StatusLine#",
        minorSeparator = " ",
        majorSeparator = "   ",
        labelStartChar = " ",
        labelEndChar = " ",
    }

    M.gitbranch()

    local ret = {}
    local list = l or {}

    for _,v in ipairs(list) do
        if(v.shift) then
            table.insert(ret, "%=")
        end
        if(v.content) then
            if(v.label) then
                table.insert(ret, style.labelHl)
                table.insert(ret, style.labelStartChar)
                table.insert(ret, v.label)
                table.insert(ret, style.labelEndChar)
            end
            table.insert(ret, style.contentHl)
            table.insert(ret, style.minorSeparator)
            table.insert(ret, v.content)
            table.insert(ret, style.majorSeparator)
        end
    end

    return ret
end

return M
