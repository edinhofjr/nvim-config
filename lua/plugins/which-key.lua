return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  priority = 100,
  ---@type wk.Opts
  opts = {
  	delay = 0,
	preset = "helix"
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
