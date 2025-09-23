-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." }
    })
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    require("plugins.tokyonight-theme"),
    require("plugins.neotree"),
    require("plugins.telescope"),
    require("plugins.which-key"),
    require("plugins.treesitter"),
    require("plugins.mason"),
    require("plugins.trouble"),
    require("plugins.notifier"),
    require("plugins.conform"),
    require("plugins.autopairs"),
    require("plugins.blink-cmp"),
    require("plugins.helm-ls"),
  },
})
