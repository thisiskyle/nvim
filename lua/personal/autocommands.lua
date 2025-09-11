vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
        require("personal.utils").gitbranch()
  end
})
