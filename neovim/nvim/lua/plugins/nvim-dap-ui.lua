return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		local remap = vim.keymap.set
		remap("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "[D]ap toggle [B]reakpoint" })
		remap("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "[D]ap [R]un or continue debugger" })
	end,
}
