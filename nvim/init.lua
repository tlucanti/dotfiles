
vim.opt.termguicolors = true

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
'nvim-telescope/telescope-symbols.nvim',
'luochen1990/rainbow',
'tpope/vim-fugitive',
'sakhnik/nvim-gdb',

{
	'HiPhish/nvim-ts-rainbow2',
	config = function()
		vim.cmd
		[[
		highlight TSRainbowBlue guifg=#3333ff ctermfg=Blue
		highlight TSRainbowYellow guifg=#ffff00 ctermfg=Yellow
		highlight TSRainbowGreen guifg=#00ff00 ctermfg=Green
		highlight TSRainbowRed guifg=#ff5522 ctermfg=Red
		highlight TSRainbowCyan guifg=#00ffff ctermfg=Cyan
		highlight TSRainbowViolet guifg=#ff00ff ctermfg=Magenta

		]]
	end
},

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

--	 {
--	 	'folke/tokyonight.nvim',
--	 	lazy = false,
--	 	priority = 1000,
--	 	opts = {},
--	 },
-- {
--   "Skullamortis/forest.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- },
{
	 'oxfist/night-owl.nvim',
	 lazy = false,
	 priority = 1000,
	 config = function()
		vim.cmd.colorscheme('night-owl')
	 end,
},
{
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
{
     'lewis6991/gitsigns.nvim',
     opts = {
         signs = {
             add = { text = '+' },
             change = { text = '~' },
             delete = { text = '_' },
             topdelete = { text = ' ' },
             changedelete = { text = '~' },
         },
         on_attach = function(bufnr)
             vim.keymap.set('n', '<leader>hp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'go to [P]revious [H]unk' })
             vim.keymap.set('n', '<leader>hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'go to [N]ext [H]unk' })
             -- vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
         end,
     },
},
} -- end plugin list

local opts = {}

require('lazy').setup(plugins, opts)

-- require("nvim-treesitter.configs").setup {
--     rainbow = {
--     enable = true,
--     -- list of languages you want to disable the plugin for
--     disable = { 'jsx', 'cpp' },
--     -- Which query to use for finding delimiters
--     query = 'rainbow-parens',
--     -- Highlight the entire buffer all at once
--     strategy = require('ts-rainbow').strategy.global,
--     hlgroups = {
--        'TSRainbowBlue',
--        'TSRainbowYellow',
--        'TSRainbowGreen',
--        -- 'TSRainbowRed',
--        'TSRainbowCyan',
--        'TSRainbowViolet',
--     },
--   }
-- }
			--'blue', 'yellow', 'cyan', 'magenta',

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
vim.diagnostic.config {
    virtual_text = false,
    float={border=_border}
}
--vim.diagnostic.disable()

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
    -- nmap('go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    -- nmap('gr', '<cmd>lua vim.lsp.buf.references()<cr>', '[G]oto [R]eferences')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    -- nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', '[R]e[n]ame')
     -- nmap('<leader>rn', require('renamer').rename, '[R]e[n]ame')
    -- map({'n', 'x'}, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    -- map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    nmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', '[C]ode [A]ction')
    nmap('<leader>q', vim.diagnostic.setloclist, 'Open Diagnostics List')

    nmap('<leader>s', require('telescope.builtin').lsp_document_symbols, 'file [S]ymbols')
    nmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'all [S]ymbols')
    nmap('<leader>u', require('telescope.builtin').lsp_references, '[G]oto [U]usages')

    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')

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
vim.opt.relativenumber = true
vim.opt.number = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_set_keymap('i', '<S-Up>', '<ESC><S-v>k', {})
vim.api.nvim_set_keymap('n', '<S-Up>', '<S-v>k', {})
vim.api.nvim_set_keymap('v', '<S-Up>', 'k', {})
vim.api.nvim_set_keymap('i', '<S-Down>', '<ESC><S-v>j', {})
vim.api.nvim_set_keymap('n', '<S-Down>', '<S-v>j', {})
vim.api.nvim_set_keymap('v', '<S-Down>', 'j', {})

vim.api.nvim_set_keymap('i', '<C-Up>', '<ESC><C-v>k', {})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-v>k', {})
vim.api.nvim_set_keymap('i', '<C-Down>', '<ESC><C-v>j', {})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-v>j', {})

vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>r', require('telescope.builtin').resume, {})
vim.keymap.set('n', '<leader>c', require('telescope.builtin').resume, {})

vim.keymap.set('n', '<C-n>', function() vim.cmd('GdbNext') end)

vim.cmd("highlight! GitSignsAdd guifg='#007700'")
vim.cmd("highlight! GitSignsChange guifg='#ffff00'")
vim.cmd("highlight! GitSignsDelete guifg='#ff0000'")

vim.cmd("highlight! CursorLine guibg='#253545'")
vim.cmd("highlight! CursorColumn guibg='#192940'")
vim.cmd("highlight! Visual guibg='#353560'")
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

local term_bg_blue_1 = '#0f0c29'
local term_bg_blue_2 = '#302b63'
local term_bg_blue_3 = '#24243e'

vim.cmd("highlight TelescopeSelection   guibg=" .. term_bg_blue_2)
vim.cmd("highlight TelescopePreviewLine guibg=" .. term_bg_blue_1)
vim.cmd("highlight PmenuSel             guibg=" .. term_bg_blue_1)
vim.cmd("highlight LazyButtonActive     guibg=" .. term_bg_blue_1)

local transparent_elements =
{
    'BufferLineTabClose', 'BufferLineCloseButtonSelected', 'BufferLineCloseButton', 'BufferLineModified', 'BufferLineModifiedSelected', 'BufferLineModifiedVisible',

    'NormalFloat', 'NormalNC', 'SignColumnSB', 'NormalSB',

    'WhichKeyFloat', -- WhichKey plugin

    'LspFloatWinBorder', 'LspFloatWinNormal', 'LspTroubleNormal', -- LSP

    'Pmenu', 'PmenuSbar', 'PmenuThumb', 'PmenuKind', 'PmenuExtra', -- Pmenu
}

for _, element in pairs(transparent_elements) do
    vim.cmd("highlight! " .. element .. " guibg=NONE ctermbg=NONE")
end


local function vim_fmt(tbl)
    local function to_str(v) if v == nil then return 'NONE' else return v end end
    return 'guifg=' .. to_str(tbl.guifg) .. ' guibg=' .. to_str(tbl.guibg) .. ' gui=' .. to_str(tbl.gui)
end

local none               = vim_fmt {}

local seemless_yellow    = vim_fmt { guifg='#fffcb0' }
local slight_yellow      = vim_fmt { guifg='#e6d8ac' }
local light_yellow       = vim_fmt { guifg='#ffee99' }
local neutral_yellow     = vim_fmt { guifg='#efd96a' }
local dim_gold           = vim_fmt { guifg='#bba800' }
local light_orange       = vim_fmt { guifg='#ffb454' }

local nitro_dimmed_blue  = vim_fmt { guifg='#7dcfee' }
local nitro_blue         = vim_fmt { guifg='#5dcfff' }
local mild_blue          = vim_fmt { guifg='#59c2ff' }
local neutral_blue       = vim_fmt { guifg='#22baf7' }
local lighter_blue       = vim_fmt { guifg='#44bad7' }
local calm_darker_blue   = vim_fmt { guifg='#005f87' }
local purple             = vim_fmt { guifg='#6666ff' }

local disabled_blue      = vim_fmt { guifg='#81a1c1' }
local selection          = vim_fmt { guibg='#7285A5' }
local light_grey         = vim_fmt { guifg='#626a73' }
local active_line        = vim_fmt { guibg='#454f62' }

local spruce_green       = vim_fmt { guifg='#45d6d3' }
local neutral_green      = vim_fmt { guifg='#a1ba8a' }
local light_green        = vim_fmt { guifg='#c2d94c' }

local slight_purple      = vim_fmt { guifg='#ccc0dd' }
local neutral_orange     = vim_fmt { guifg='#af5f00' }
local neutral_peach      = vim_fmt { guifg='#b65d69' }
local neutral_red        = vim_fmt { guifg='#f07178' }
local almost_transparent = vim_fmt { guibg='#70333a' }

local vstudio_if         = vim_fmt { guifg='#758ea8', gui='bold' }

local colours = {
    Conditional                    = vstudio_if,
    PreProc                        = vstudio_if,
    Comment                        = disabled_blue,
    Constant                       = none,
    Statement                      = neutral_peach, -- @repeat.cpp
    Keyword                        = neutral_peach,
    Visual                         = selection,
    LineNr                         = 'guifg=#717d8b',--
    MsgArea                        = none,
    Number                         = 'guifg=#ef572f',
    -- Normal                         = none,
    Normal                         = 'guifg=#fdfdfd guibg=NONE',
    cBlock                         = 'guifg=#9bbb16',
    Operator                       = none,
    SignColumn                     = none,
    String                         = 'guifg=#a64747', --'guifg=#ea9212',
    cIncluded                      = 'guifg=#ff4a6b',
    ['@lsp.type.namespace.cpp']    = nitro_dimmed_blue,
    Structure                      = spruce_green, -- neutral_green,
    Type                           = spruce_green, -- neutral_green,
    ['@lsp.type.class']            = spruce_green, -- neutral_green,
    cStorageClass                  = 'guifg=#961f12', -- const/volatile/...
    --CursorLine                     = none,
    --CursorColumn                   = active_line,
    CursorLineNr                   = seemless_yellow, -- , 'guifg=#9dff00 gui=NONE',
    CursorLineSign                 = none,
    Delimiter                      = none,
    Identifier                     = none,
    DiffAdd                        = 'guibg=#0b2914',
    DiffDelete                     = 'guibg=#420b12 guifg=#808080',
    DiffChange                     = 'guibg=#706409',
    DiffText                       = 'guibg=#827c52',
    ['@lsp.type.variable']         = slight_yellow,
    Folded                         = 'guibg=#4a5c85 guifg=NONE',
    MoreMsg                        = 'guifg=#91ab8c gui=bold',
    Function                       = nitro_dimmed_blue, -- 'guifg=#87afaf',
    ['@lsp.type.function']         = nitro_dimmed_blue, -- 'guifg=#87afaf',
    Macro                          = 'guifg=#87afaf',
    Special                        = 'guifg=#829212', -- @constructor.cpp
    ['@lsp.mod.functionScope.cpp'] = seemless_yellow,
    Todo                           = 'guibg=#6ca9d2 guifg=#000000',
    BufferLineBufferSelected       = nitro_blue,-- , 'guifg=#E66d46',
    Search                         = 'guibg=#cebe6b',
    Substitute                     ='guifg=#2e3440 guibg=#d08770',
    GitSignsAdd                    = 'guifg=#317827',
    GitSignsChange                 = 'guifg=#af5f00',
    GitSignsDelete                 = neutral_peach,
    FoldColumn                     = 'guifg=#7f992f guibg=NONE gui=bold',
    ['@operator.cpp']              = 'guifg=#e2efbd',
    ['@parameter.cpp']             = dim_gold,
    ['FloatBorder']                = 'guifg=#6666ff',
    ['@text.danger']               = 'guifg=#DC143C guibg=NONE gui=NONE', -- ???
    DiagnosticWarn                 = 'guifg=#838411',
    NeoTreeDirectoryIcon           = 'guifg=#1c78fd',
    NeoTreeRootName                = 'gui=NONE',
}

for group,colour in pairs(colours) do
    vim.cmd('highlight! ' .. group .. ' ' .. colour)
end

local function link(which, to)
    vim.cmd("hi clear " .. which)
    vim.cmd("hi link " .. which .. " " .. to)
end

link("NeoTreeCursorLine",      "CursorColumn")
link("Include",                "Conditional")
link("LazyDimmed",             "LazyComment")
link("LazyProp",               "Normal")
link("MatchParen",             "Visual")
link("TelescopeBorder",        "FloatBorder")
-- link("cIncluded",              "Number")
link("diffAdded",              "DiffAdd")
link("diffRemoved",            "DiffDelete")
link("@lsp.type.parameter",    "@parameter.cpp")
link("@character.cpp",         "String")
link("@lsp.type.operator.cpp", "@operator.cpp")
link("BufferLineCloseButtonSelected", "BufferLineBufferSelected")

-- Status line, split separator
vim.cmd[[hi StatusLineNC gui=NONE guibg=NONE guifg=NONE]]
vim.cmd[[hi StatusLine gui=NONE guibg=NONE guifg=NONE]]
vim.cmd[[hi VertSplit guifg=#7285a5]]

-- nvim-hlslens
vim.cmd[[hi HlSearchLens guibg=none guifg=#ff8f40]]
vim.cmd[[hi HlSearchLens guibg=none guifg=#9b2d30]]
vim.cmd[[hi HlSearchLensNear guifg=#c2d94c]]

-- Errors
vim.cmd[[hi DiagnosticUnderlineError gui=NONE]]

