local wk = require("which-key")
local lsp = vim.lsp.buf

wk.register({
	e = {"<cmd>NvimTreeToggle<cr>", "Toggle Explorer"},
	o = {"<cmd>NvimTreeFocus<cr>", "Focus Exlorer"},
	l = {
		name = "lsp",
		a = {function () lsp.code_action() end, "code_action"},
		d = {function () lsp.definition() end, "definition"},
		D = {function () lsp.declaration() end, "declaration"},
		i = {function () lsp.implementation() end, "implementation"},
		t = {function () lsp.type_definition() end, "type_definition" },
		K = {function () lsp.hover() end , "hover"},
	}
}, {prefix = "<leader>"})
