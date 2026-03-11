return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},
			-- assign formatters per filetype
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				markdown = { "prettier" },
				["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
			},
		})

		-- ===============================
		-- Auto format on save
		-- ===============================
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype

				-- Example: skip SQL files
				if ft == "sql" then
					return
				end

				-- Async formatting with error notifications
				local ok, err = pcall(function()
					conform.format({
						bufnr = args.buf,
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000, -- 1 second timeout
					})
				end)

				-- Show UI message if formatting fails
				if not ok and err then
					vim.notify("⚠️ Formatting error: " .. err, vim.log.levels.WARN)
				end
			end,
		})

		-- Formatter configs
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}
		conform.formatters.shfmt = {
			prepend_args = { "-i", "4" },
		}

		-- ===============================
		-- Manual format keymap
		-- ===============================
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			local ok, err = pcall(function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,
				})
			end)
			if not ok and err then
				vim.notify("⚠️ Formatting error: " .. err, vim.log.levels.WARN)
			end
		end, { desc = "Prettier Format whole file or range (in visual mode)" })
	end,
}
