let mapleader = " "

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ThePrimeagen/vim-be-good'

Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'

Plug 'machakann/vim-sandwich'
Plug 'cohama/lexima.vim'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'arzg/vim-rust-syntax-ext'

Plug 'Shougo/deoplete.nvim' 
Plug 'Shougo/deoplete-lsp'
Plug 'neovim/nvim-lsp'

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

set termguicolors 
syntax on
set background=dark
color xcodedarkhc

filetype plugin indent on
set relativenumber 
set expandtab 
set autoindent 
set smartindent 
set tabstop=2 
set shiftwidth=2 
set signcolumn=yes
set completeopt=menu
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:deoplete#enable_at_startup = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" Language Server stuff
lua << END
  require'nvim_lsp'.tsserver.setup({})
  require'nvim_lsp'.pyls.setup({})
  require'nvim_lsp'.rust_analyzer.setup({})
END

" Remaps 
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader><Enter> :nohl<CR>
nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <leader>s :so %<CR>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
