return {
	-- {
	--   "olimorris/onedarkpro.nvim",
	--   priority = 1000, -- load before everything else
	--   config = function()
	--     vim.cmd.colorscheme("onedark_dark")
	--   end,
	-- },
	-- One Dark theme
	{
		"navarasu/onedark.nvim",
    priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	},
}
