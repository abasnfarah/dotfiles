return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local remap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			-- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
			remap("n", "?", api.tree.toggle_help, opts("Help"))
			remap("n", ".", api.tree.change_root_to_node, opts("Change to highlighted directory"))
			remap("n", "<Backspace>", api.tree.change_root_to_parent, opts("Close Directory"))
			remap("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
			remap("n", "<C-k>", api.node.show_info_popup, opts("Info"))
			remap("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
			remap("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
			remap("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			remap("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			remap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
			remap("n", "<CR>", api.node.open.edit, opts("Open"))
			remap("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
			remap("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
			remap("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
			remap("n", ",", api.node.run.cmd, opts("Run Command"))
			remap("n", "-", api.tree.change_root_to_parent, opts("Up"))
			remap("n", "a", api.fs.create, opts("Create File Or Directory"))
			remap("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
			remap("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
			remap("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
			remap("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
			remap("n", "c", api.fs.copy.node, opts("Copy"))
			remap("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
			remap("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
			remap("n", "]c", api.node.navigate.git.next, opts("Next Git"))
			remap("n", "d", api.fs.remove, opts("Delete"))
			remap("n", "D", api.fs.trash, opts("Trash"))
			remap("n", "E", api.tree.expand_all, opts("Expand All"))
			remap("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
			remap("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
			remap("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
			remap("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
			remap("n", "f", api.live_filter.start, opts("Live Filter: Start"))
			remap("n", "g?", api.tree.toggle_help, opts("Help"))
			remap("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
			remap("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
			remap("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
			remap("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
			remap("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
			remap("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))
			remap("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
			remap("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
			remap("n", "o", api.node.open.edit, opts("Open"))
			remap("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
			remap("n", "p", api.fs.paste, opts("Paste"))
			remap("n", "P", api.node.navigate.parent, opts("Parent Directory"))
			remap("n", "q", api.tree.close, opts("Close"))
			remap("n", "r", api.fs.rename, opts("Rename"))
			remap("n", "R", api.tree.reload, opts("Refresh"))
			remap("n", "s", api.node.run.system, opts("Run System"))
			remap("n", "S", api.tree.search_node, opts("Search"))
			remap("n", "u", api.fs.rename_full, opts("Rename: Full Path"))
			remap("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
			remap("n", "W", api.tree.collapse_all, opts("Collapse"))
			remap("n", "x", api.fs.cut, opts("Cut"))
			remap("n", "y", api.fs.copy.filename, opts("Copy Name"))
			remap("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
			remap("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
			remap("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
		end
		local options = {
			on_attach = my_on_attach,
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = false,
				side = "left",
				width = 30,
				preserve_window_proportions = true,
			},
			git = {
				enable = true,
				ignore = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				root_folder_label = false,
				highlight_git = true,
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						-- git = true,
					},

					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			remap("n", "<leader>e", ":NvimTreeToggle<CR>", mergeOpts(opts, { desc = "Toggl[e] NvimTree" })),
		}

		require("nvim-tree").setup(options)
	end,
}
