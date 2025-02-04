local M = {}

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

        local status = ""

        local e = count[vim.diagnostic.severity.ERROR]
        local w = count[vim.diagnostic.severity.WARN]
        local i = count[vim.diagnostic.severity.INFO]
        local h = count[vim.diagnostic.severity.HINT]

        if(e > 0 or w > 0 or i > 0 or h > 0) then
            status = "diag: "
        end

        if(e > 0) then status = status .. "E:" .. e .. " " end
        if(w > 0) then status = status .. "W:" .. w .. " " end
        if(i > 0) then status = status .. "I:" .. i .. " " end
        if(h > 0) then status = status .. "H:" .. h .. " " end

        return status

    end
end

return M
