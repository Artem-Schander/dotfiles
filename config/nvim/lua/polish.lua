-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
--
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   pattern = "scp://*",
--   callback = function()
--     -- vim.g.nvim_tree_disable_netrw = 0
--     -- vim.g.nvim_tree_hijack_netrw = 0
--
--     -- Check if netrw is not loaded yet, then load its scripts
--     if not package.loaded["netrw"] then
--       vim.cmd("runtime! plugin/netrw.vim")
--       vim.cmd("runtime! plugin/netrwPlugin.vim")
--     end
--   end,
-- })

vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#565f89", nocombine = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.bo.commentstring = "// %s"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vue",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, math.min(20, vim.api.nvim_buf_line_count(bufnr)), false)
        for _, line in ipairs(lines) do
            if line:match('<template%s+lang="pug"') then
                vim.bo.commentstring = "//- %s"
                return
            end
        end
    end,
})

vim.api.nvim_create_autocmd('BufNewFile', {
  group = vim.api.nvim_create_augroup('RemoteFile', {clear = true}),
  callback = function()
    local f = vim.fn.expand('%:p')
    for _, v in ipairs{'sftp', 'scp', 'ssh', 'dav', 'fetch', 'ftp', 'http', 'rcp', 'rsync'} do
      local p = v .. '://'
      if string.sub(f, 1, #p) == p then
        vim.cmd[[
          " unlet g:loaded_netrw
          " unlet g:loaded_netrwPlugin
          runtime! plugin/netrwPlugin.vim
          silent Explore %
        ]]
        vim.api.nvim_clear_autocmds{group = 'RemoteFile'}
        break
      end
    end
  end
})
