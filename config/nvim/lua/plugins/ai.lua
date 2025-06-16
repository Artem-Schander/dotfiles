-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    event = "VeryLazy",
    opts = {
      picker = "snacks",
      adapters = {
        copilot = {
          provider = "copilot", -- nutzt GitHub Copilot Chat mit Claude (wenn verfügbar)
        },
      },
      default_adapter = "copilot",
      chat = {
        strategy = "split", -- auch möglich: "float", "tab"
        context = {
          include_buffer = true,
          include_project_files = true,
          include_diagnostics = true,
          include_git = true,
          max_tokens = 8000,
        },
        auto_save_files = true,
      },
      actions = {
        edit = {
          strategy = "replace_buffer",
          prompt = "Improve this code:",
        },
        write = {
          strategy = "create_file",
          prompt = "Generate a new file for:",
        },
      },
    },
  },
}
