require('nvim_comment').setup({
    comment_empty = false
})

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true,
    config = {
      css = '// %s'
    }
  }
}
