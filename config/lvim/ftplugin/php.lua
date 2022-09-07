-- local util = require 'lspconfig/util'
--
-- local opts = {
--   root_dir = function (pattern)
--     local cwd  = vim.loop.cwd();
--     local root = util.root_pattern("composer.json", ".git")(pattern);
--
--     -- prefer cwd if root is a descendant
--     return util.path.is_descendant(cwd, root) and cwd or root;
--   end,
--   on_attach = require("lvim.lsp").common_on_attach,
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- }
--
-- local servers = require "nvim-lsp-installer.servers"
-- local server_available, requested_server = servers.get_server "phpactor"
-- if server_available then
--   opts.cmd_env = requested_server:get_default_options().cmd_env
-- end
--
-- require("lvim.lsp.manager").setup("phpactor", opts)

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter"}, {
      pattern = { "*.blade.php" },
      command = "setfiletype phtml",
})
