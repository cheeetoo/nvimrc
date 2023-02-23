local M = {}

local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

-- format
vim.keymap.set("n", "<leader>F", "<CMD>NullFormat<CR>")

-- diff view
vim.keymap.set("n", "<leader>dd", "<CMD>DiffviewToggle<CR>")

-- edit config
vim.keymap.set("n", "<leader>ee", "<CMD>e ~/.config/nvim/<CR>")

-- format
vim.keymap.set("n", "<leader>rf", "<CMD>RustFmt<CR>")
vim.keymap.set("n", "<leader>I", "<CMD>silent !npx prettier --write .<CR>")

--git
vim.keymap.set("n", "<leader>lg", "<CMD>LazyGit<CR>")

-- zen mode
vim.keymap.set("n", "<leader>zz", "<CMD>ZenMode<CR>")

-- terminal and file explorer
vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm<CR>")
vim.keymap.set("n", "<leader>o", "<CMD>NvimTreeToggle<CR>")

-- exit terminal
vim.keymap.set("t", "<leader>kj", "<C-\\><C-n>")

-- caps to escape
vim.keymap.set("i", "kj", "<esc>")

-- windows and panes
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wc", "<CMD>bd<CR>")

-- bufferline
vim.keymap.set("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
local map = vim.api.nvim_set_keymap

map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", { silent = true })
map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", { silent = true })

return M
