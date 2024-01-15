-- Load the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


-- Ensure that these plugins are downloaded
local lazy = require("lazy")
lazy.setup({
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	{ "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },

	{ "nvim-telescope/telescope.nvim" },

	{ "numToStr/Comment.nvim" },

	{ "kylechui/nvim-surround" },

	{ "catppuccin/nvim" }
})


-- LSP configuration
local lspconfig = require("lspconfig")
lspconfig.util.on_setup = lspconfig.util.add_hook_after(
	lspconfig.util.on_setup,
	function(config, user_config)
		config.capabilities = vim.tbl_deep_extend(
			'force',
			config.capabilities,
			require('cmp_nvim_lsp').default_capabilities(),
			vim.tbl_get(user_config, 'capabilities') or {}
		)
	end
)

vim.diagnostic.config({
	float = { border = 'rounded' },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end
})

-- Setup Mason
local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	handlers = {
		function(server)
			require('lspconfig')[server].setup({})
		end,
	},
})


-- Setup Treesitter
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	auto_install = true,
	highlight = {
		enable = true
	}
})


-- Setup Completion
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources(
		{
			{ name = "nvim_lsp" },
		},
		{
			{ name = "buffer" },
		}
	)
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" }
	}
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" }
	}, {
		{ name = "cmdline" }
	})
})


-- Setup Telescope
local telescope = require("telescope")
local t_builtin = require("telescope.builtin")
local t_actions = require("telescope.actions")
telescope.setup({
	defaults = {
		file_ignore_patterns = { ".git/" }
	}
})
vim.keymap.set("n", "<C-p>f", t_builtin.find_files)
vim.keymap.set("n", "<C-p>p", t_builtin.git_files)
vim.keymap.set("n", "<C-p>g", t_builtin.live_grep)
vim.keymap.set("n", "<C-p>b", t_builtin.buffers)
vim.keymap.set("n", "<C-p>h", t_builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<C-p>s", t_builtin.lsp_document_symbols)


-- Setup Comment
local comment = require("Comment")
comment.setup()


-- Setup Surround
local nvim_surround = require("nvim-surround")
nvim_surround.setup()

-- Setup theme
local catppuccin = require("catppuccin")
catppuccin.setup({
	transparent_background = true
})
