local M = {}

-- Session name helper
function M.get_session_name()
  local name = vim.fn.getcwd()
  local branch = vim.trim(vim.fn.system("git branch --show-current"))
  if vim.v.shell_error == 0 and branch ~= "" then
    return name .. branch
  else
    return name
  end
end

-- Example: Escape session name for resession
function M.escape_session_name(str)
  return str:gsub("/", "_")
end

-- Add more utility functions below as needed
-- function M.some_other_helper() ... end

return M
