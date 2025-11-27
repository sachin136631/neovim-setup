vim.g.mapleader = "\\"
vim.opt.clipboard = "unnamedplus"
vim.o.timeout = true
vim.o.timeoutlen = 200
vim.o.ttimeoutlen = 10

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)


local opts = {}
require("lazy").setup("plugins")
require("vim-options")



