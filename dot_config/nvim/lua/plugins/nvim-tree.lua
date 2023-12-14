return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })
    local action = require("nvim-tree.api")
    local r = require('utils.remaps')
    r.noremap("n", "<leader>e", action.tree.toggle, "toggle explorer")
    r.noremap("n", "<leader>eb", function() action.tree.toggle() end , "show current buffer in explorer")

    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#eliasa5
    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      callback = function() vim.cmd("NvimTreeClose") end,
    })
  end,
}
