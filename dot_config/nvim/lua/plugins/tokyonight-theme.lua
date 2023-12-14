return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  init = function ()
    vim.opt.termguicolors = true
    vim.cmd('colorscheme tokyonight')
  end
}

