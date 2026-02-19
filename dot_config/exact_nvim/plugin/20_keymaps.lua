-- General mappings ===========================================================

local nmap = function(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

local xmap = function(lhs, rhs, desc)
	vim.keymap.set("x", lhs, rhs, { desc = desc })
end

nmap("[p", '<Cmd>exe "put! " . v:register<CR>', "Paste Above")
nmap("]p", '<Cmd>exe "put "  . v:register<CR>', "Paste Below")

nmap("<Esc>", "<Cmd>nohlsearch<CR>", "Clear highlights")

nmap("<C-u>", "<C-u>zz", "Move one page [U]p")
nmap("<C-d>", "<C-d>zz", "Move one page [D]own")

-- Leader mappings ============================================================

local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

Config.leader_group_clues = {
	{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
	-- { mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
	-- { mode = "n", keys = "<Leader>f", desc = "+Find" },
	{ mode = "n", keys = "<Leader>g", desc = "+Git" },
	-- { mode = "n", keys = "<Leader>l", desc = "+Language" },
	-- { mode = "n", keys = "<Leader>m", desc = "+Map" },
	-- { mode = "n", keys = "<Leader>o", desc = "+Other" },
	{ mode = "n", keys = "<Leader>s", desc = "+Search" },
	{ mode = "n", keys = "<Leader>t", desc = "+Terminal" },
	-- { mode = "n", keys = "<Leader>v", desc = "+Visits" },
	--
	-- { mode = "x", keys = "<Leader>g", desc = "+Git" },
	-- { mode = "x", keys = "<Leader>l", desc = "+Language" },
}

-- Buffer Mappings
local new_scratch_buffer = function()
	vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end

nmap_leader("ba", "<Cmd>b#<CR>", "Alternate")
nmap_leader("bd", "<Cmd>lua MiniBufremove.delete()<CR>", "Delete")
nmap_leader("bD", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", "Delete!")
nmap_leader("bs", new_scratch_buffer, "Scratch")
nmap_leader("bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", "Wipeout")
nmap_leader("bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", "Wipeout!")

nmap_leader("fe", "<Cmd>lua MiniFiles.open()<CR>", "Directory")

-- Search Mappings
nmap_leader("sn", "<Cmd>lua MiniNotify.show_history()<CR>", "Notifications")
nmap_leader("s/", '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader("s:", '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader(",", "<Cmd>Pick buffers<CR>", "Buffers")
nmap_leader("sq", '<Cmd>Pick list scope="quickfix"<CR>', "Quickfix")
nmap_leader("sd", '<Cmd>Pick diagnostic scope="all"<CR>', "Diagnostic workspace")
nmap_leader("sD", '<Cmd>Pick diagnostic scope="current"<CR>', "Diagnostic buffer")
nmap_leader("sf", "<Cmd>Pick files<CR>", "Files")
nmap_leader("sk", "<Cmd>Pick keymaps<CR>", "Keymaps")
nmap_leader("sg", "<Cmd>Pick grep_live<CR>", "Grep live")
nmap_leader("sw", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
xmap_leader("sw", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
nmap_leader("sh", "<Cmd>Pick help<CR>", "Help tags")
nmap_leader("sb", '<Cmd>Pick buf_lines scope="current"<CR>', "Lines (buf)")
nmap_leader("sr", "<Cmd>Pick resume<CR>", "Resume")

-- Git Mappings
local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
local git_log_buf_cmd = git_log_cmd .. " --follow -- %"

-- nmap_leader("fc", "<Cmd>Pick git_commits<CR>", "Commits (all)")
-- nmap_leader("fC", '<Cmd>Pick git_commits path="%"<CR>', "Commits (buf)")
-- nmap_leader("fa", '<Cmd>Pick git_hunks scope="staged"<CR>', "Added hunks (all)")
-- nmap_leader("fA", pick_added_hunks_buf, "Added hunks (buf)")
nmap_leader("fm", "<Cmd>Pick git_hunks<CR>", "Modified hunks (all)")
nmap_leader("fM", '<Cmd>Pick git_hunks path="%"<CR>', "Modified hunks (buf)")
nmap_leader("ga", "<Cmd>Git diff --cached<CR>", "Added diff")
nmap_leader("gA", "<Cmd>Git diff --cached -- %<CR>", "Added diff buffer")
nmap_leader("gc", "<Cmd>Git commit<CR>", "Commit")
nmap_leader("gC", "<Cmd>Git commit --amend<CR>", "Commit amend")
nmap_leader("gd", "<Cmd>Git diff<CR>", "Diff")
nmap_leader("gD", "<Cmd>Git diff -- %<CR>", "Diff buffer")
nmap_leader("gl", "<Cmd>" .. git_log_cmd .. "<CR>", "Log")
nmap_leader("gL", "<Cmd>" .. git_log_buf_cmd .. "<CR>", "Log buffer")
nmap_leader("go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle overlay")
nmap_leader("gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "Show at cursor")
xmap_leader("gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "Show at selection")

-- LSP Mappings
nmap("gws", '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>', "Symbols workspace (live)")
nmap("gds", '<Cmd>Pick lsp scope="document_symbol"<CR>', "Symbols document")
nmap("gra", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Actions")
nmap("gdf", "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic popup")
nmap("grf", '<Cmd>lua require("conform").format()<CR>', "Format")
xmap("grf", '<Cmd>lua require("conform").format()<CR>', "Format selection")
nmap("gri", '<Cmd>Pick lsp scope="implementation"<CR>', "Implementation")
nmap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
nmap("grn", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
nmap("grr", '<Cmd>Pick lsp scope="references"<CR>', "References")
nmap("grd", '<Cmd>Pick lsp scope="definition"<CR>', "Source definition")
nmap("grt", '<Cmd>Pick lsp scope="type_definition"<CR>', "Type definition")

-- Terminal Mappings
nmap_leader("tT", "<Cmd>horizontal term<CR>", "Terminal (horizontal)")
nmap_leader("tt", "<Cmd>vertical term<CR>", "Terminal (vertical)")
