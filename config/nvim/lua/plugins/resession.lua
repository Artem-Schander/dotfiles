-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "stevearc/resession.nvim",
  opts = {
    autosave = {
      enabled = true,
      interval = 60,
      notify = false,
    },
  },
  init = function()
    local resession = require("resession")
    local uv = vim.loop

    -- Helper: Projektpfad → Sessionname (z.B. ~/projects/api → "api")
    local function get_project_name()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    -- Auto-Load passende Session beim Start
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Nur wenn kein spezieller Buffer (wie bei `nvim file.txt`)
        if vim.fn.argc() == 0 then
          local session_name = get_project_name()
          if resession.list()[session_name] then
            resession.load(session_name)
          end
        end
      end,
    })

    -- Auto-Save beim Verlassen
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        local session_name = get_project_name()
        resession.save(session_name, { notify = false })
      end,
    })
  end,
}
