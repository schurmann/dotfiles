return {
  "xero/trouble.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      padding = false,
      use_diagnostic_signs = true,
    })
    local r = require("utils.remaps")
    r.noremap("n", "<leader>lr", ":TroubleToggle lsp_references<cr>", "lsp references ")
    r.noremap("n", "<leader>le", ":TroubleToggle document_diagnostics<cr>", "diagnostics")
    r.noremap("n", "<leader>t", ":TroubleToggle workspace_diagnostics<cr>", "toggle trouble")
  end,
}
