require('nvim-autopairs').setup({
  -- Don't add pairs if it already has a close pair in the same line
  check_ts = true, -- Use treesitter to check for a pair
  
  -- Fast wrap feature (similar to Doom Emacs' smartparens wrapping)
  -- Use <M-e> (Alt+e) to quickly wrap text in brackets
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment'
  },
})