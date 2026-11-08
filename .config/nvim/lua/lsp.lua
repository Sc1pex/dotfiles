require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls' },
  automatic_installation = true,
})

-- jdtls needs Java 25+, the shell's JAVA_HOME is older.
-- Prefer a plain src/ folder over .git so lab dirs without a build file get the right source root.
vim.lsp.config('jdtls', {
  cmd_env = { JAVA_HOME = '/usr/lib/jvm/java-25-openjdk' },
  root_markers = {
    { 'mvnw', 'gradlew', 'settings.gradle', 'settings.gradle.kts' },
    { 'build.xml', 'pom.xml', 'build.gradle', 'build.gradle.kts' },
    'src',
    '.git',
  },
  -- Only applies to folders without a build file
  settings = { java = { project = { sourcePaths = { 'src' } } } },
})

require('lazydev').setup()

-- Enable Format on Save natively via LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    -- This calls the native LSP formatting function before saving
    pcall(vim.lsp.buf.format, { bufnr = args.buf })
  end,
})

