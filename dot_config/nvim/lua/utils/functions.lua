local M = {}

M.cmd = function(name, command, desc)
  vim.api.nvim_create_user_command(name, command, desc)
end

return M
