vim.lsp.config('gopls', {
  cmd = {'/Users/lindsay.kowalick/go/bin/gopls' ,'-remote=auto'},
  filetypes = {'go'},
  root_markers = {'go.mod', 'go.sum'},
  settings = {
	  gopls = {
		  directoryFilters = {
			  "-bazel-dd-source",
			  "-bazel-out",
			  "-bazel-testlogs",
			  "-bazel-bin",
		  },
	  },	
  },
  on_attach = function(client, bufnr)
	  vim.lsp.completion.enable(true, client.id, bufnr, {
		  autotrigger = true,
		  -- convert = function(item)
		  --     return { abbr = item.label:gsub('%b()', '') }
		  -- end,
	  })
  end
})
vim.lsp.enable('gopls')

vim.lsp.config('ruff', {})

vim.lsp.enable('ruff')

vim.lsp.config('starpls', {
  cmd = {'starpls' ,"server", "--experimental_infer_ctx_attributes", "--experimental_enable_label_completions"},
  filetypes = {'bzl'},
  -- root_markers = {'go.mod', 'go.sum'},
  on_attach = function(client, bufnr)
	  vim.lsp.completion.enable(true, client.id, bufnr, {
		  autotrigger = true,
		  -- convert = function(item)
		  --     return { abbr = item.label:gsub('%b()', '') }
		  -- end,
	  })
  end
})

vim.lsp.enable('starpls')

vim.cmd[[source ~/.vimrc]]
vim.opt.number = true
vim.opt.sidescroll = 1
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 4
vim.opt.foldenable = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 999
vim.opt.signcolumn = 'yes'
vim.g.makeprg = 'bzl test //domains/api_platform/rapid/apps/rapid:go_default_test'
vim.g.netrw_banner = 0
vim.g.termguicolors = true
vim.diagnostic.config({
  signs = true,
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  update_in_insert = true,
  float = {
    header = false,
    border = 'rounded',
    focusable = true,
  }
})

vim.cmd[[set nocompatible]]
vim.cmd[[set completeopt+=fuzzy,menuone,popup,noinsert]]


vim.cmd[[set background=light]]
vim.cmd[[colorscheme github]]

require('nvim-treesitter.configs').setup {
  ensure_installed = { "go", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require('treesitter-context').setup {
  multiline_threshold = 3,
}
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--vim.opt.foldtext = "nvim_treesitter#foldtext()"
vim.opt.foldtext = "getline(v:foldstart)"

vim.cmd[[nmap <leader>t :TagbarToggle<CR>]]

return require('packer').startup(function(use)
  use 'cormacrelf/vim-colors-github'
  use 'junegunn/fzf.vim'
  use 'junegunn/fzf'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter'
  use 'preservim/tagbar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'wbthomason/packer.nvim'
  use 'bazelbuild/vim-bazel'
  use 'google/vim-maktaba'
  use 'neovim/nvim-lspconfig'
end)

