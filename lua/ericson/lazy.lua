-- install lazy.nvim if its not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim/"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- add lazypath to runtime path
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup({
    --require('ericson.plugins.fidget'),
    --require('ericson.plugins.nvim-notify'),
    require('ericson.plugins.telescope'),
    require('ericson.plugins.cmp'),
    require('ericson.plugins.lsp'),
    require('ericson.plugins.colorschemes'),
    require('ericson.plugins.treesitter'),
    require('ericson.plugins.vibecheck'),
    require('ericson.plugins.toys'),
})
