-- Install lazy.nvim plugin manager
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

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    require("plugins.gitsigns"),
    require("plugins.indent-blankline"),
    require("plugins.lsp.lspconfig"),
    require("plugins.lsp.mason"),
    require("plugins.luasnip"),
    require("plugins.nvim-autopairs"),
    require("plugins.nvim-cmp"),
    require("plugins.nvim-tree"),
    require("plugins.nvim-web-devicons"),
    require("plugins.plenary"),
    require("plugins.telescope"),
    require("plugins.tokyonight-theme"),
    require("plugins.treesitter"),
    require("plugins.which-key"),
  },
})

