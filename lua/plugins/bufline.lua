return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup{
			options = {
				diagnostics = "nvim_lsp",
				color_icons = true,
				separator_style = "slope",
                                hover = {
                                    enabled = true,
                                    delay = 200,
                                    reveal = { "close" }
                                },
			},
		}
               		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }
		map("n", "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", opts)
		map("n", "<A-Right>", "<cmd>BufferLineCycleNext<cr>", opts)
		map("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", opts)
		map("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", opts)
	end,
}
