local M = {}

M.config = nil

M.default = {
    sections = {
        { label = "Buf", content = "%f" },
    },
    style = {
        special_chars = {
            minorSeparator = " ",
            majorSeparator = "   ",
            left = "",
            right = "",
            leftPadding = " ",
            rightPadding = " ",
        }
    }
}



function M.lsp()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if(#clients == 0) then
        return "No active client"
    end
    return clients[1].name
end


function M.diagnostics()
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


local function hl(s)
    return "%#" .. s .. "#"
end



local function build(opts)

    local statusline = vim.api.nvim_get_hl(0, { name = "StatusLine", link = true })
    local visual = vim.api.nvim_get_hl(0, { name = "Visual", link = true })

    vim.api.nvim_set_hl(0, "StatusLineContent", statusline)
    vim.api.nvim_set_hl(0, "StatusLineLabel", visual)

    vim.api.nvim_set_hl(0, "StatusLineLeft", { fg = visual.bg, bg = statusline.bg })
    vim.api.nvim_set_hl(0, "StatusLineRight", { fg = visual.bg, bg = statusline.bg })

    local ret = {}
    local style = opts.style or M.default.style
    local sections = opts.sections or M.default.sections


    for _,v in ipairs(sections) do
        if(v.shift) then
            table.insert(ret, "%=")
        end
        if(v.content) then
            if(v.label) then
                table.insert(ret, hl("StatusLineLeft"))
                table.insert(ret, style.special_chars.left)
                table.insert(ret, hl("StatusLineLabel"))
                table.insert(ret, style.special_chars.leftPadding)
                table.insert(ret, v.label)
                table.insert(ret, style.special_chars.rightPadding)
                table.insert(ret, hl("StatusLineRight"))
                table.insert(ret, style.special_chars.right)
            end
            table.insert(ret, hl("StatusLineContent"))
            table.insert(ret, style.special_chars.minorSeparator)
            table.insert(ret, v.content)
            table.insert(ret, style.special_chars.majorSeparator)
        end
    end

    return ret
end


function M.setup(opts)

    require("personal.utils").set_global_gitbranch()

    if(opts == nil) then
        if(M.config == nil) then
            M.config = M.default
        end

        return table.concat(build(M.config))
    end

    M.config = opts
    return table.concat(build(M.config))

end

return M
