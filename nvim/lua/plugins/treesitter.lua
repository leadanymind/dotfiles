return  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
	local configs = require('nvim-treesitter.configs')
	configs.setup({
	    highlight = {
		enable = true
	    },
	    indent = { enable = true },
	    autotage = { enable = true },
	    -- Adds whatever languages you want installed in the list below, comma separated strings V
	    ensure_installed = { "lua", "c", "java", "python", "rust", "zig", "vim", "vimdoc", "c_sharp", "elixir", "dockerfile", "fennel", "go", "json", "jinja", "scss", "css", "yaml"},
	    auto_install = false,
	})
    end
}
