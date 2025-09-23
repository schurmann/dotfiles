return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
    "benfowler/telescope-luasnip.nvim", -- :Telescope luasnip to see available snippes for filetype
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<C-e>', function() builtin.oldfiles({ only_cwd = true }) end,
      { desc = 'Telescope recent files' })

    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          height = 0.75,
          width = 0.9
        },
        mappings = {
          i = {
            ['<esc>'] = actions.close,         -- close on escape, even if in insert mode
            ['<C-d>'] = actions.delete_buffer, -- close selected buffer in buffers list
          },
        },
      },
    })
  end,
}
