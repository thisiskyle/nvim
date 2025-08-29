-- this fixes the relative file paths so the buffer names
-- are not full paths in the statusline
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
        vim.cmd("cd .")
  end
})
