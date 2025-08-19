return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = true, -- Highlight current scope (e.g., function or block)
			show_start = false, -- Don't show start of scope line
			show_end = false, -- Don't show end of scope line
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy", -- UI or special buffers
			},
			buftypes = { "terminal", "nofile" }, -- Skip terminal and non-file buffers
		},
	},
}
