return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "astro",
          "eslint",
          "gopls",
          "helm_ls",
          "jsonls",
          "lua_ls",
          "mdx_analyzer",
          "tailwindcss",
          "ts_ls",
          "yamlls",
        },
        automatic_installation = true,
      })
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.config('helm_ls', {
        settings = {
          yamlls = {
            path = "yaml-language-server"
          }
        },
      })
    end
  }
}
