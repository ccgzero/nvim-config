--1.准备lazy.nvim模块
--stdpath("data")
--linux : ~/.local/share/nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
--2.将lazypath设置为运行时路径
--rtp(runtime path)
--nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
--否则，下面的require("lazy")是找不到的
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
