return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		opts = {
			ensure_installed = {
				"lua",
				"c",
				"cpp",
				"python",
				"bash",
				"json",
				"html",
				"css",
			},
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},
		},
	},
}
