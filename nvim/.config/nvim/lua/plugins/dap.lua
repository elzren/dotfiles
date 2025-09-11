return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local mason_dap = require("mason-nvim-dap")
		local dap = require("dap")
		local ui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		mason_dap.setup({
			ensure_installed = { "codelldb" },
			automatic_installation = true,
		})

		-- C++ config for codelldb
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		-- Also apply to C
		dap.configurations.c = dap.configurations.cpp

		-- Dap Virtual Text
		dap_virtual_text.setup()

		-- Dap UI

		ui.setup()

		-- vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end

		-- Key bindings
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Conditional Breakpoint" })

		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue/Start" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Next (Step Over)" })
		vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })
		vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debug: Quit" })

		-- UI & REPL
		vim.keymap.set("n", "<leader>dt", ui.toggle, { desc = "Debug: Toggle UI" })
		vim.keymap.set("n", "<leader>dR", dap.repl.open, { desc = "Debug: Open REPL" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
	end,
}
