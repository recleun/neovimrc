local wk = require("which-key")

wk.register({
	h = {
		name = "Harpoon",
		a = "Add current file to harpoon",
		l = "View currently harpooned files",
		t = "View currently harpooned files with telescope",
		q = "View buffer no. 1",
		w = "View buffer no. 2",
		e = "View buffer no. 3",
		r = "View buffer no. 4",
		n = "Go to next buffer in list",
		b = "Go to previous buffer in list",
	},
}, { prefix = "<leader>" })

wk.register({
	r = {
		name = "Rename",
		s = "Rename Symbol",
	},
}, { prefix = "<leader>" })

wk.register({
	e = "Open file explorer",
	f = "Search for a file",
	s = "Rename all occurences/Search",
}, { prefix = "<leader>" })

wk.register({
	c = {
		name = "Code/Crates/Clear",
		s = "Clear search",
		a = "Code actions",
		t = "Toggle crates.nvim",
		r = "Reload crates.nvim",
		u = "Update crate",
		U = "Upgrade crate",
		v = "List crate versions",
		f = "List crate features",
		d = "List crate dependencies",
		R = "Open crate repository",
		D = "Open crate documentation",
		H = "Open crate homepage",
		C = "Open crates.io",
		x = "Extract crate to inline table",
		X = "Extract crate to table",
	},
}, { prefix = "<leader>" })

wk.register({
	c = {
		name = "Update with crates.nvim",
		u = "Update crates",
		U = "Upgrade crates",
	},
	p = "Print without overwriting clipboard",
}, { prefix = "<leader>", mode = "v" })
