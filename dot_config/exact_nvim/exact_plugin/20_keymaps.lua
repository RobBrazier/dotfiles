-- General mappings --

local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

local nmap = function(lhs, rhs, desc)
  map('n', lhs, rhs, { desc = desc })
end

local xmap = function(lhs, rhs, desc)
  map('x', lhs, rhs, { desc = desc })
end

local vmap = function(lhs, rhs, desc)
  map('v', lhs, rhs, { desc = desc })
end

nmap('[p', '<Cmd>exe "put! " . v:register<CR>', 'Paste Above')
nmap(']p', '<Cmd>exe "put "  . v:register<CR>', 'Paste Below')

nmap('<Esc>', '<Cmd>nohlsearch<CR>', 'Clear highlights')

nmap('<C-u>', '<C-u>zz', 'Move one page [U]p')
nmap('<C-d>', '<C-d>zz', 'Move one page [D]own')

-- Movement mappings --
nmap('<A-h>', '<<', 'De-indent line')
vmap('<A-h>', '<gv', 'De-indent selection')
nmap('<A-j>', ':m .+1<CR>==', 'Move line down')
vmap('<A-j>', ":m '>+1<CR>gv=gv", 'Move line down')
nmap('<A-k>', ':m .-2<CR>==', 'Move line up')
vmap('<A-k>', ":m '<-2<CR>gv=gv", 'Move line up')
nmap('<A-l>', '>>', 'Indent line')
vmap('<A-l>', '>gv', 'Indent selection')

-- Window movement
nmap('<C-h>', '<C-w>h', 'Focus on left window')
nmap('<C-j>', '<C-w>j', 'Focus on below window')
nmap('<C-k>', '<C-w>k', 'Focus on above window')
nmap('<C-l>', '<C-w>l', 'Focus on right window')

-- Command mode cursor movement
map('c', '<M-h>', '<Left>', { silent = false, desc = 'Left' })
map('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })

-- Insert mode cursor movement
map('i', '<M-h>', '<Left>', { noremap = false, desc = 'Left' })
map('i', '<M-j>', '<Down>', { noremap = false, desc = 'Down' })
map('i', '<M-k>', '<Up>', { noremap = false, desc = 'Up' })
map('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

-- Terminal mode curos movement
map('t', '<M-h>', '<Left>', { desc = 'Left' })
map('t', '<M-j>', '<Down>', { desc = 'Down' })
map('t', '<M-k>', '<Up>', { desc = 'Up' })
map('t', '<M-l>', '<Right>', { desc = 'Right' })

-- Leader mappings --

local nmap_leader = function(suffix, rhs, desc)
  nmap('<Leader>' .. suffix, rhs, desc)
end
local xmap_leader = function(suffix, rhs, desc)
  xmap('<Leader>' .. suffix, rhs, desc)
end

Config.leader_group_clues = {
  { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
  { mode = 'n', keys = '<Leader>f', desc = '+File' },
  { mode = 'n', keys = '<Leader>g', desc = '+Git' },
  { mode = 'x', keys = '<Leader>g', desc = '+Git' },
  { mode = 'n', keys = '<Leader>s', desc = '+Search' },
  { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
}

-- Buffer Mappings
local new_scratch_buffer = function()
  vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end

nmap_leader('ba', '<Cmd>b#<CR>', 'Alternate')
nmap_leader('bd', '<Cmd>bdelete<CR>', 'Delete')
nmap_leader('bD', '<Cmd>bdelete!<CR>', 'Delete!')
nmap_leader('bs', new_scratch_buffer, 'Scratch')
nmap_leader('bw', '<Cmd>bwipeout<CR>', 'Wipeout')
nmap_leader('bW', '<Cmd>bwipeout!<CR>', 'Wipeout!')

nmap_leader('fe', '<Cmd>lua MiniFiles.open()<CR>', 'File Explorer')

-- Search Mappings
nmap_leader('sn', '<Cmd>lua MiniNotify.show_history()<CR>', 'Notifications')
nmap_leader('s/', '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader('s:', '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader(',', '<Cmd>Pick buffers<CR>', 'Buffers')
nmap_leader('sq', '<Cmd>Pick list scope="quickfix"<CR>', 'Quickfix')
nmap_leader('sd', '<Cmd>Pick diagnostic scope="all"<CR>', 'Diagnostic workspace')
nmap_leader('sD', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostic buffer')
nmap_leader('sf', '<Cmd>Pick files<CR>', 'Files')
nmap_leader('sk', '<Cmd>Pick keymaps<CR>', 'Keymaps')
nmap_leader('sg', '<Cmd>Pick grep_live<CR>', 'Grep live')
nmap_leader('sw', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
xmap_leader('sw', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
nmap_leader('sh', '<Cmd>Pick help<CR>', 'Help tags')
nmap_leader('sb', '<Cmd>Pick buf_lines scope="current"<CR>', 'Lines (buf)')
nmap_leader('sr', '<Cmd>Pick resume<CR>', 'Resume')

-- Git Mappings
local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
local git_log_buf_cmd = git_log_cmd .. ' --follow -- %'

nmap_leader('gm', '<Cmd>Pick git_hunks<CR>', 'Modified hunks (all)')
nmap_leader('gM', '<Cmd>Pick git_hunks path="%"<CR>', 'Modified hunks (buf)')
nmap_leader('ga', '<Cmd>Git diff --cached<CR>', 'Added diff')
nmap_leader('gA', '<Cmd>Git diff --cached -- %<CR>', 'Added diff buffer')
nmap_leader('gc', '<Cmd>Git commit<CR>', 'Commit')
nmap_leader('gC', '<Cmd>Git commit --amend<CR>', 'Commit amend')
nmap_leader('gd', '<Cmd>Git diff<CR>', 'Diff')
nmap_leader('gD', '<Cmd>Git diff -- %<CR>', 'Diff buffer')
nmap_leader('gl', '<Cmd>' .. git_log_cmd .. '<CR>', 'Log')
nmap_leader('gL', '<Cmd>' .. git_log_buf_cmd .. '<CR>', 'Log buffer')
nmap_leader('go', '<Cmd>lua MiniDiff.toggle_overlay()<CR>', 'Toggle overlay')
nmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>', 'Show at cursor')
xmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>', 'Show at selection')

-- LSP Mappings
nmap('gws', '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>', 'Symbols workspace (live)')
nmap('gds', '<Cmd>Pick lsp scope="document_symbol"<CR>', 'Symbols document')
nmap('gra', '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Actions')
nmap('gdf', '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostic popup')
nmap('grf', '<Cmd>lua require("conform").format()<CR>', 'Format')
xmap('grf', '<Cmd>lua require("conform").format()<CR>', 'Format selection')
nmap('gri', '<Cmd>Pick lsp scope="implementation"<CR>', 'Implementation')
nmap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
nmap('grn', '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
nmap('grr', '<Cmd>Pick lsp scope="references"<CR>', 'References')
nmap('grd', '<Cmd>Pick lsp scope="definition"<CR>', 'Source definition')
nmap('grt', '<Cmd>Pick lsp scope="type_definition"<CR>', 'Type definition')

-- Clipboard mappings
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
nmap('gp', '"+p', 'Paste from system clipboard')
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
xmap('gp', '"+P', 'Paste from system clipboard')

-- Reselect latest changed, put, or yanked text
map('n', 'gV', '"g`[" . strpart(getregtype(), 0, 1) . "g`]"', { expr = true, replace_keycodes = false, desc = 'Visually select changed text' })

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
map('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })

-- Terminal Mappings
nmap_leader('tT', '<Cmd>horizontal term<CR>', 'Terminal (horizontal)')
nmap_leader('tt', '<Cmd>vertical term<CR>', 'Terminal (vertical)')
