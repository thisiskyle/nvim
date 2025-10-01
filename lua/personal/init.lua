require("personal.keymaps")
require("personal.pack")
require("personal.settings")
require("personal.autocommands")

-- add this to path so our lua/personal folder can contain all my config instead of using the
-- root nvim config folder
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/personal"))
vim.opt.rtp:append(vim.fn.expand(vim.fn.stdpath("config") .. "/lua/personal/after"))
