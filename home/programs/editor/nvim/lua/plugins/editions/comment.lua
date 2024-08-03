return {
	"numToStr/Comment.nvim",
	config = function()
		local ft = require("Comment.ft")

		ft.gleam = { "//%s" }

		require("Comment").setup()
	end,
}
