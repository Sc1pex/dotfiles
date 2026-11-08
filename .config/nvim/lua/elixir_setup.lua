local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup({
  nextls = { enable = false },
  credo = { enable = true },  -- Enables the Credo linter natively
  elixirls = {
    enable = true,
    settings = elixirls.settings({
      dialyzerEnabled = false, -- Can be slow, enable if you use Dialyzer heavily
      enableTestLenses = false,
    }),
    on_attach = function(client, bufnr)
      -- Because you are using Neovim 0.12, your default LSP keybindings 
      -- (like gd, gr, K) will automatically apply here too!
    end,
  }
})