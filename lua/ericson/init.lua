require("ericson.keymaps")
require("ericson.lazy_init")
require("ericson.settings")

-- we add this to path so our lua/ericson folder can contain all my config instead of using the
-- root nvim config folder
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/ericson"))
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/ericson/after"))
