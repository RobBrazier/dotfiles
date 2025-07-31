-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Remap <c-u> and <c-d> to stay in the centre of the screen
map('n', '<C-u>', '<C-u>zz', { desc = 'Move one page [U]p' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Move one page [D]own' })

-- Buffer deletion
map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = '[B]uffer [D]elete' })

-- MiniFiles
map('n', '<leader>fe', function()
  require('mini.files').open()
end, { desc = '[F]ile [E]xplorer' })

-- MiniPick --

-- Top Pickers & Explorer
map('n', '<leader><space>', function()
  local MiniPick = require 'mini.pick'
  local buf_count = #vim.fn.getbufinfo { buflisted = 1 }
  if buf_count == 1 and vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
    MiniPick.builtin.files()
  else
    MiniPick.builtin.files()
  end
end, { desc = 'Smart Find Files' })

map('n', '<leader>,', function()
  require('mini.pick').builtin.buffers()
end, { desc = '[,] Buffers' })

map('n', '<leader>sb', function()
  require('mini.extra').pickers.buf_lines()
end, { desc = '[S]earch [B]uffer Lines' })

map('n', '<leader>/', function()
  require('mini.pick').builtin.grep_live()
end, { desc = '[/] Grep' })

map('n', '<leader>sn', function()
  require('mini.pick').builtin.files(nil, { source = { cwd = vim.fn.stdpath 'config' } })
end, { desc = '[S]earch [N]eovim files' })

map('n', '<leader>sf', function()
  require('mini.pick').builtin.files()
end, { desc = '[S]earch [F]iles' })

map('n', '<leader>sp', function()
  require('mini.extra').pickers.git_files()
end, { desc = '[S]earch [P]roject Files' })

-- Grep & Search
map('n', '<leader>sg', function()
  require('mini.pick').builtin.grep_live()
end, { desc = '[S]earch by [G]rep' })

map({ 'n', 'x' }, '<leader>sw', function()
  local MiniPick = require 'mini.pick'
  local word = vim.fn.expand '<cword>'
  MiniPick.builtin.grep { pattern = word }
end, { desc = '[S]earch current [W]ord' })

map('n', '<leader>sh', function()
  require('mini.pick').builtin.help()
end, { desc = '[S]earch [H]elp' })

map('n', '<leader>:', function()
  require('mini.extra').pickers.history { scope = 'cmd' }
end, { desc = '[:] Command History' })

map('n', '<leader>sk', function()
  require('mini.extra').pickers.keymaps()
end, { desc = '[S]earch [K]eymaps' })

map('n', '<leader>sl', function()
  require('mini.extra').pickers.list { scope = 'location' }
end, { desc = '[S]earch [L]ocation List' })

map('n', '<leader>sm', function()
  require('mini.extra').pickers.marks()
end, { desc = '[S]earch [M]arks' })

map('n', '<leader>sr', function()
  require('mini.pick').builtin.resume()
end, { desc = '[S]earch [R]esume' })

map('n', '<leader>sq', function()
  require('mini.extra').pickers.list { scope = 'quickfix' }
end, { desc = '[S]earch [R]esume' })

-- Diagnostics
map('n', '<leader>sd', function()
  require('mini.extra').pickers.diagnostic { scope = 'all' }
end, { desc = '[S]earch [D]iagnostics' })

map('n', '<leader>sD', function()
  require('mini.extra').pickers.diagnostic { scope = 'current' }
end, { desc = '[S]earch Buffer [D]iagnostics' })
