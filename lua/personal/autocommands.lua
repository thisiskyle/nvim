-- this fixes the buffer name so its not a full path
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
        vim.cmd("cd .")
  end
})
