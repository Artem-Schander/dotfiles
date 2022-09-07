local M = {}

M.config = function()
    require("hop").setup()
    vim.api.nvim_set_keymap("n", ",,", ":HopChar2<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", ",.", ":HopChar1<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", ",w", ":HopWord<cr>", { silent = true })
end

return M
