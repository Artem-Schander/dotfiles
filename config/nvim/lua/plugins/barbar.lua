local M = {}

M.config = function()
    vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })

    -- vim.api.nvim_set_keymap('n', '<S-x>', ':BufferCloseAllButCurrent<CR>', { noremap = true, silent = true })
    vim.cmd('command! Bonly :BufferCloseAllButCurrent')
    vim.cmd('command! BOnly :BufferCloseAllButCurrent')
    vim.cmd('command! Bufonly :BufferCloseAllButCurrent')
    vim.cmd('command! BufOnly :BufferCloseAllButCurrent')
end

return M
