return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup({})

    mason_lspconfig.setup({
      ensure_installed = {
        "astro",
        "html",
        "lua_ls",
        "svelte",
        "tsserver",
      },
      automatic_installation = true,
    })
  end
}
