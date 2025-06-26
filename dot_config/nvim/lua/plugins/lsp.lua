local servers = {
  tailwindcss = {
    settings = {
      tailwindCSS = {
        includeLanguages = {
          heex = 'html',
          eelixir = 'html',
          elixir = 'html',
        },
      },
    },
  },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

    local Snacks = require 'snacks'
    vim.keymap.set('n', 'gr', Snacks.picker.lsp_references)
    vim.keymap.set('n', '<leader>q', Snacks.picker.diagnostics_buffer)
    vim.keymap.set('n', '<leader>Q', Snacks.picker.diagnostics)

    vim.keymap.set('n', '<F2>', ':IncRename ')
    vim.keymap.set('n', '<F3>', function()
      return ':IncRename ' .. vim.fn.expand '<cword>'
    end, { expr = true })

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end)
    end
  end,
})

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Neoconf needs to be set up before lspconfig
      require('neoconf').setup {}

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
        },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require 'lspconfig'

      lspconfig.zls.setup {
        capabilities = capabilities,
      }
      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            check = {
              allTargets = false,
            },
            cargo = {
              allTargets = false,
            },
          },
        },
      }
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    },
  },

  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup()
    end,
  },
}
