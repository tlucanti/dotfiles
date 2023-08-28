
-------------------------------------------------------------------------------
-- bootstrap lazy vim

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- plugin settings

local plugins = {
{
	-- (dependency) lua utils
	'nvim-lua/plenary.nvim',
}, {
	-- (dependency) lsp utils
	'williamboman/mason.nvim',

	config = function()
		require('mason').setup()
	end,
}, {
	-- (dependency) ui utils
	'MunifTanjim/nui.nvim',
}, {
	-- (dependency) icons
	'nvim-tree/nvim-web-devicons',
},

{
	-- (core plugin) mobility through code
	'nvim-telescope/telescope.nvim',
}, {
	-- (core plugin) notifications
	'rcarriga/nvim-notify',
}, {
	-- (core plugin) ui
	'folke/noice.nvim',
},

'echasnovski/mini.surround',
'folke/todo-comments.nvim',
'tpope/vim-repeat',
'ggandor/leap.nvim',
'rhysd/vim-clang-format',
'nvim-lualine/lualine.nvim',
{
	'miyakogi/conoline.vim',

	config = function()
	end,
},

'neovim/nvim-lspconfig',
'L3MON4D3/LuaSnip',
'saadparwaiz1/cmp_luasnip',
 {
	'hrsh7th/nvim-cmp',

 	config = function()
		local cmp = require('cmp')
		cmp.setup({
			snippet = {
	 			expand = function(args)
					require('luasnip').lsp_expand(args.body)
	 			end,
			},
			mapping = cmp.mapping{
				['<C-e>'] = cmp.mapping.abort(),
				['<s-Tab>'] = cmp.mapping.select_prev_item(),
				['<Tab>'] = cmp.mapping.select_next_item(),
				 -- ['<Down>'] = cmp.mapping.close(),
				 --  ['<Up>'] = cmp.mapping.close(),
				 -- ['<CR'] = cmp.mapping.select_next_item(),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'path' },
				{ name = 'buffer' },
				{ name = 'luasnip' },
			},
		})
	end,
},
'hrsh7th/cmp-buffer',
'amarakon/nvim-cmp-buffer-lines',
'hrsh7th/cmp-calc',
'uga-rosa/cmp-dictionary',
'hrsh7th/cmp-omni',
'hrsh7th/cmp-nvim-lsp',
'nvim-treesitter/nvim-treesitter-textobjects',
'wsdjeg/vim-fetch',

{
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
    		'nvim-treesitter/playground',
	},
        build = ':TSUpdate',
}, {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = { }
}, {
	'folke/persistence.nvim',
	event = 'BufReadPre',
	opts = { }
}, {
	'lukas-reineke/virt-column.nvim',
	lazy = false,
	config = function()
		vim.cmd
		[[
		set colorcolumn=80,120
		hi VirtColumn guifg=#345678
		]]
		require'virt-column'.setup { char = '║' }
	end
},

	-- {
	-- 	'folke/tokyonight.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },

{
	 'oxfist/night-owl.nvim',
	 lazy = false,
	 priority = 1000,
	 config = function()
		vim.cmd.colorscheme('night-owl')
	 end,
}, {
        'VonHeikemen/lsp-zero.nvim',
        lazy = false,
        branch = 'v2.x',
        dependencies = {
		{
		    'neovim/nvim-lspconfig',
		    dependencies = {
		        'folke/neodev.nvim'
		    }
		},
		{
		    'williamboman/mason-lspconfig.nvim',
		    dependencies = {
		        {
		            'williamboman/mason.nvim',
		            build = function()
		                pcall(vim.api.nvim_command, 'MasonUpdate')
		            end,
		            lazy=false,
		            opts = {}
		        },
		    }
		},

		{
		    -- Autocompletion
		    'hrsh7th/nvim-cmp',
		    dependencies = {
		        'hrsh7th/cmp-buffer',
		        'hrsh7th/cmp-nvim-lsp',
		        'hrsh7th/cmp-nvim-lua',
		        'hrsh7th/cmp-path',
		        'onsails/lspkind-nvim', -- Enables icons on completions
		        { -- Snippets
		            'L3MON4D3/LuaSnip',
		            build = 'make install_jsregexp',
		            dependencies = {
		    		'saadparwaiz1/cmp_luasnip',
		                'rafamadriz/friendly-snippets',
		            }
		        }
		    }
		},

		'stevearc/dressing.nvim',
		'j-hui/fidget.nvim',
		'folke/neodev.nvim',
		'ray-x/lsp_signature.nvim',
		'filipdutescu/renamer.nvim',
		}
	},


	'akinsho/bufferline.nvim',
	-- 'folke/edgy.nvim',
	-- 'RRethy/vim-illuminate',
}

local opts = {}

require('lazy').setup(plugins, opts)

require('bufferline').setup()

require('notify').setup({
	--background_colour='#000',
})


require('leap').add_default_mappings(true)

require('lualine').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
	capabilities = capabilities,
}

-- require('tokyonight').setup({
--   -- use the night style
--   style = 'storm',
--   -- disable italic for functions
--   styles = {
--     functions = {}
--   },
--   sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
--   -- Change the 'hint' color to the 'orange' color, and make the 'error' color bright red
--   on_colors = function(colors)
--     colors.hint = colors.orange
--     colors.error = '#ff0000'
--   end
-- })

local signs = { error = '✘', warn = '▲', hint = '⚑', info = '»' }
local signs = { error = ' ', warn = ' ', hint = '', info = ' ' }
local signs = { error = ' ', warn = '🧠', hint = '', info = ' ' }
local signs = { error = '🌊', warn = '🧠', hint = '', info = ' ' }
local signs = { error = '🌊', warn = '🧠', hint = '💡', info = ' ' }
local signs = { error = '🌊', warn = '🧠', hint = '', info = ' ' }
local signs = { error = '🧠', warn = '🚱', hint = '', info = ' ' }
local signs = { error = '🧠', warn = '🪚', hint = '', info = ' ' }
local signs = {}

local lsp = require('lsp-zero')

lsp.set_server_config({
    --single_file_support = false,
    on_init = function(client)
        --client.server_capabilities.semanticTokensProvider = nil
    end,
    capabilities = {
        textDocument = {
            foldingRange = { dynamicRegistration = false,
                lineFoldingOnly = true
            }
        }
    }
})

 lsp.set_sign_icons(signs)
local _border = 'single'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)
--vim.diagnostic.config {
--    virtual_text = false,
--    float={border=_border}
--}
vim.diagnostic.disable()

lsp.on_attach(function(client, bufnr)
    local map = function(modes, keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local nmap = function(keys, func, desc)
        map(modes, keys, func, desc)
    end

    lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}

    nmap('K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>', '[G]oto [D]efinition')
    nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', '[G]oto [D]eclaration')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', '[G]oto [I]mplementation')
    nmap('go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    -- nmap('gr', '<cmd>lua vim.lsp.buf.references()<cr>', '[G]oto [R]eferences')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    -- nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', '[R]e[n]ame')
    nmap('<leader>rn', require('renamer').rename, '[R]e[n]ame')
    map({'n', 'x'}, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    nmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', '[C]ode [A]ction')
    nmap('<leader>q', vim.diagnostic.setloclist, 'Open Diagnostics List')

    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    nmap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show [E]rror Floating Window')
    nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Previous [D]iagnostics')
    nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next [D]iagnostics')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    require 'lsp_signature'.on_attach(
    {
        bind = true,
        handler_opts = {
            border = 'rounded'
        },
        toggle_key='<C-r>',
        hint_prefix = '🪓',
    }, bufnr)
end)

-- lsp.extend_cmp()

-- vim opt
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

