return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require('nvim-tree.api')
    local r = require('utils.remaps')
    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "v", api.node.open.vertical, opts "vertical split")
    end

    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      on_attach = on_attach,
    })
    r.noremap("n", "<leader>e", api.tree.toggle, "toggle explorer")

    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#eliasa5
    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      callback = function() vim.cmd("NvimTreeClose") end,
    })
  end,
}
