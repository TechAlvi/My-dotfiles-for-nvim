
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
      },
    },

    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }

          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}

