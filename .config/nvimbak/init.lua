local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local options = {}

require("vim-options")
require("lazy").setup("plugins")
-- Make sure pywal.nvim was loaded via Lazy.nvim
local ok, _ = pcall(require, "pywal")
if not ok then return end

-- Apply pywal colors now
require("pywal").setup()

-- Watch for changes in colors.json and reload automatically
local wal_colors = vim.fn.expand("~/.cache/wal/colors.json")

vim.loop.fs_event_start(
  vim.loop.new_fs_event(),
  wal_colors,
  {},
  vim.schedule_wrap(function()
    pcall(require("pywal").setup)
    print("🔁 Pywal colors reloaded")
  end)
)

