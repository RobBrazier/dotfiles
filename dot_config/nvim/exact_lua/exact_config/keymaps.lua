-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Remap <c-u> and <c-d> to stay in the centre of the screen
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move one page [U]p' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move one page [D]own' })

-- Buffer deletion
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = '[B]uffer [D]elete' })

-- Move lines up/down in normal mode
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Move lines up/down in visual mode
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Move characters left/right in normal mode
vim.keymap.set('n', '<A-h>', 'xhP', { desc = 'Move character left' })
vim.keymap.set('n', '<A-l>', 'xp', { desc = 'Move character right' })

-- Move selection left/right in visual mode
vim.keymap.set('v', '<A-h>', '<gv', { desc = 'Move selection left' })
vim.keymap.set('v', '<A-l>', '>gv', { desc = 'Move selection right' })

-- (Un)Indent in visual mode
vim.keymap.set('v', '<', '<<', { desc = 'Un-indent selection' })
vim.keymap.set('v', '>', '>>', { desc = 'Indent selection' })
