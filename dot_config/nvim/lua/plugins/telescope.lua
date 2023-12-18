return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
    "benfowler/telescope-luasnip.nvim", -- :Telescope luasnip to see available snippes for filetype
  },
  config = function(_, opts)
    local telescope = require("telescope")
    require('telescope').load_extension('luasnip')
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')
    local i = require('utils.icons')
    local r = require('utils.remaps')
    telescope.setup({
      defaults = {
        borderchars = i.telescope,
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },

      },
      extensions = {
        file_browser = {
          depth = 1,
          auto_depth = false,
          hidden = { file_browser = true, folder_browser = true },
          hide_parent_dir = false,
          collapse_dirs = false,
          prompt_path = false,
          quiet = false,
          dir_icon = "󰉓 ",
          dir_icon_hl = "Default",
          display_stat = { date = true, size = true, mode = true },
          git_status = true,
        },
      }
    })

    r.noremap("n", "<leader>f", telescope.extensions.file_browser.file_browser, "browse files")
    r.noremap("n", "<leader>.",
      function()
        telescope.extensions.file_browser.file_browser({
          path = vim.fn.stdpath("config")
        })
      end,
      "nvim dotfiles"
    )
    r.noremap('n', '<leader>ff', builtin.find_files, "find files")
    r.noremap('n', '<leader>fg', builtin.live_grep, "grep in files")
    r.noremap('n', '<leader>fb', builtin.buffers, "find opened buffers")
    r.noremap('n', '<leader>fh', builtin.help_tags, "help")
    r.noremap('n', '<leader>fc', builtin.command_history, "command history")
    r.noremap('n', '<C-e>', builtin.oldfiles, "show recently opened")

    telescope.load_extension("file_browser")
  end
}
