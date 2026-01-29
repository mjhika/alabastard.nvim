local M = {}

M.setup = function()
	local palettes = {
		dark = {
			bg = "#0E1415",
			fg = "#CECECE",
			red = "#FF6060",
			redbg = "#2B1D1E",
			green = "#95CB82",
			greenbg = "#203028",
			purple = "#CC8BC9",
			yellow = "#FFF080",
			yellowbg = "#0E1415",
			blue = "#71ADE7",
			bluebg = "#0E1415",
			linecolumn = "#22272F",
			select = "#33373F",
			punctuation = "#8E8E8E",
		},
		light = {
			bg = "#FFFFFF",
			fg = "#000000",
			red = "#CC3333",
			redbg = "#FFE0E0",
			green = "#3C5C00",
			greenbg = "#EEFBD9",
			purple = "#8A3EB5",
			yellow = "#6D6607",
			yellowbg = "#FFFABC",
			blue = "#195B7C",
			bluebg = "#DBF1FF",
			linecolumn = "#F5F5F5",
			select = "#D7DFEA",
			punctuation = "#7A7A7A",
		},
	}

	local style = vim.o.background
	local p = palettes[style]

	if not p then
		print("Defaulting to Light theme.")
		p = palettes["light"]
	end

	vim.api.nvim_create_augroup("AlabastardAutocmds", { clear = true })

	-- Clear existing syntax highlighting
	vim.cmd("hi clear")
	vim.cmd("hi clear Statement")
	vim.cmd("hi clear Special")

	-- base color
	vim.api.nvim_set_hl(0, "Normal", { fg = p.fg, bg = p.bg })

	-- visual selection
	vim.api.nvim_set_hl(0, "Visual", { fg = p.fg, bg = p.select })

	-- line highlight and columns
	vim.api.nvim_set_hl(0, "Cursor", { fg = p.fg, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "lCursor", { fg = p.fg, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "CursorIM", { fg = p.fg, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "CursorLine", { fg = "NONE", bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "CursorColumn", { fg = "NONE", bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "ColorColumn", { fg = "NONE", bg = p.linecolumn })

	-- lighten the punctuation
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = p.punctuation })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = p.punctuation })
	vim.api.nvim_set_hl(0, "@punctuation.special", { fg = p.punctuation })
	vim.api.nvim_set_hl(0, "MatchParen", { fg = p.blue, bg = p.bluebg })

	-- green for strings
	vim.api.nvim_set_hl(0, "@string", { fg = p.green, bg = p.greenbg })
	vim.api.nvim_set_hl(0, "@string.regexp", { fg = p.green, bg = p.greenbg })
	vim.api.nvim_set_hl(0, "@string.special", { fg = p.green, bg = p.greenbg })

	-- purple for constants, keywords, etc.
	vim.api.nvim_set_hl(0, "@constant", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@number", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@number.float", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@boolean", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@character", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@character.special", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@string.special.symbol", { fg = p.purple, bold = true })

	-- yellow for comments
	vim.api.nvim_set_hl(0, "Comment", { fg = p.yellow, bg = p.yellowbg })
	vim.api.nvim_set_hl(0, "@comment", { fg = p.yellow, bg = p.yellowbg })

	-- blue for global definitions
	vim.api.nvim_set_hl(0, "@function", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@function.method", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.mod.declaration", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.mod.definition", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@function.call", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@function.macro", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@function.method.call", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@class", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@type.definition", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@property", { fg = "NONE", bg = "NONE" })

	-- status line and pmenu
	vim.api.nvim_set_hl(0, "StatusLine", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "TabLine", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "TabLineFill", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "PmenuKind", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "PmenuExtra", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = p.fg, bg = p.select })

	-- clear existing filetype highlights for this theme
	vim.api.nvim_clear_autocmds({ group = "AlabastardAutocmds" })

	-- Clojure keywords
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "clojure",
		group = "AlabastardAutocmds",
		callback = function()
			vim.api.nvim_set_hl(0, "clojureKeyword", { fg = p.purple, bold = true })
		end,
	})

	-- Elixir atoms
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "elixir",
		group = "AlabastardAutocmds",
		callback = function()
			vim.api.nvim_set_hl(0, "elixirAtom", { fg = p.purple, bold = true })
		end,
	})
end

return M
