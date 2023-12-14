return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local r = require('utils.remaps')

    local on_attach = function(client, bufnr)
      r.noremap("n", "K", vim.lsp.buf.hover, "show references")
      r.noremap("n", "gR", "<cmd>Telescope lsp_references<CR>", "show references")
      r.noremap("n", "gD", vim.lsp.buf.declaration, "show usages")
      r.noremap("n", "<F6>", vim.lsp.buf.rename, "rename")
      r.noremap("n", "gs", vim.lsp.buf.signature_help, "show signature")
      r.noremap("n", "gf", vim.lsp.buf.format, "show signature")
      r.noremap("n", "<A-CR>", vim.lsp.buf.code_action, "quick fix")
      r.noremap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "show definition")
      r.noremap("n", "<F2>", vim.diagnostic.goto_next, "next diagnostic")
      r.noremap("n", "<F1>", vim.diagnostic.goto_prev, "previous diagnostic")
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig["astro"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        }
      }
    })

    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
}
