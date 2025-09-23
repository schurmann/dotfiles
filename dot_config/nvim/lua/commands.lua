local r = require("utils.remaps")

r.noremap("n", "<leader>d", vim.cmd.bd, "close buffer")
r.noremap("n", "<leader>hc", ':noh<CR>', "clear highlight")
r.noremap("n", "<leader>qq", ':qa!<CR>', "quit without saving")
r.noremap("n", "<leader>w", ':w<CR>', "save buffer")

-- Diagnostics
r.noremap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "next diagnostic")
r.noremap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "previous diagnostic")


-- LSP
r.noremap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
r.noremap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>')
r.noremap('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>')
r.noremap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
r.noremap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>')
r.noremap('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
r.noremap({ 'i', 's' }, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
r.noremap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
r.noremap('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
r.noremap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>')

-- Function to go to the first "normal" file buffer
local function go_to_code_window()
  -- Loop through all windows (winnr('$') gives total window count)
  for i = 1, vim.fn.winnr('$') do
    -- Get the buffer number for window 'i'
    local bufnr = vim.fn.winbufnr(i)

    -- Get buffer properties to identify what type of buffer this is
    local buftype = vim.fn.getbufvar(bufnr, '&buftype')   -- Buffer type (empty for normal files)
    local filetype = vim.fn.getbufvar(bufnr, '&filetype') -- File type detected by vim

    -- Skip special windows and find "normal" code files
    -- buftype == '' means it's a regular file buffer (not help, quickfix, terminal, etc.)
    -- filetype ~= 'neo-tree' excludes the file explorer
    if buftype == '' and filetype ~= 'neo-tree' then
      -- Found a code window! Switch to it.
      -- win_getid(i) converts window number to window ID
      -- win_gotoid() switches focus to that window ID
      vim.fn.win_gotoid(vim.fn.win_getid(i))
      return -- Exit function after finding first match
    end
  end
end

r.noremap('n', '<leader><esc>', go_to_code_window, 'focus code window')
