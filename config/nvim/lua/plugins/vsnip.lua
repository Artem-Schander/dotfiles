local M = {}

M.config = function()

    vim.cmd [[
        let g:vsnip_filetypes = {}
        let g:vsnip_filetypes.javascriptreact = ['javascript']
        let g:vsnip_filetypes.vue = ['vue', 'javascript', 'typescript']
        let g:vsnip_filetypes.typescriptreact = ['typescript']
    ]]


    -- vim.g.vsnip_filetypes = {}
    -- vim.g.vsnip_filetypes.javascriptreact = {'javascript'}
    -- vim.g.vsnip_filetypes.vue = {'vue', 'javascript', 'typescript'}
    -- vim.g.vsnip_filetypes.typescriptreact = {'typescript'}
end

return M
