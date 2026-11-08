-- Compile the whole src/ tree and run <package>.Main in a reusable tmux pane
local function tmux(args)
  local res = vim.system(vim.list_extend({ 'tmux' }, args), { text = true }):wait()
  return res.code == 0 and vim.trim(res.stdout) or nil
end

vim.keymap.set('n', '<leader>r', function()
  if not vim.env.TMUX then
    vim.notify('Not inside tmux', vim.log.levels.WARN)
    return
  end

  local root = vim.fs.root(0, 'src')
  local pkg
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 20, false)) do
    pkg = line:match('^%s*package%s+([%w_.]+)%s*;')
    if pkg then break end
  end
  if not root or not pkg then
    vim.notify('No src/ root or package found', vim.log.levels.WARN)
    return
  end

  vim.cmd('silent wall')
  local cmd = ("clear; cd %s && javac -d out $(find src -name '*.java') && java -cp out %s.Main")
    :format(vim.fn.shellescape(root), pkg)

  -- Reuse the runner pane if it's still alive, otherwise split a new one right of nvim
  local pane = vim.g.java_run_pane
  if pane and tmux({ 'display-message', '-p', '-t', pane, '#{pane_id}' }) == pane then
    tmux({ 'send-keys', '-t', pane, 'C-c' })
  else
    pane = tmux({ 'split-window', '-h', '-d', '-l', '40%', '-t', vim.env.TMUX_PANE, '-P', '-F', '#{pane_id}' })
    vim.g.java_run_pane = pane
  end

  tmux({ 'send-keys', '-t', pane, '-l', cmd })
  tmux({ 'send-keys', '-t', pane, 'Enter' })
end, { buffer = true, desc = 'Run Java exercise in tmux pane' })
