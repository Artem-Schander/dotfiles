return {
  "Saghen/blink.cmp",
  opts = {
    completion = {
      autocomplete = { "InsertEnter", "TextChangedI" },
      completeopt = "menu,menuone,noselect",
    },
    sources = {
      providers = {
        copilot = {
          min_keyword_length = 0,
          insert_newline = true,
          score_offset = 1000,
        },
        -- add other providers here if needed
      },
    },
  },
}
