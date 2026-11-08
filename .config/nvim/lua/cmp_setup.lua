local blink = require('blink.cmp')

-- Asynchronously ensure the native binary is built 
-- We intentionally do NOT use :pwait() so that it doesn't freeze your Neovim startup
pcall(function()
  blink.build()
end)

blink.setup({
  -- The default 'super-tab' setup is perfect for Doom Emacs users.
  -- Tab selects next item, Shift-Tab previous, Enter accepts.
  keymap = { preset = 'super-tab' },

  appearance = {
    -- Uses a nice modern icon set
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  -- Enable signature help (shows function arguments as you type)
  signature = { enabled = true },

  -- Sources control where your autocomplete data comes from
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- Clean UI with documentation appearing alongside the completions
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
    ghost_text = { enabled = true },
  },
})