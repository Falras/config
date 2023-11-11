function! Cond(Cond, ...)
		let opts = get(a:000, 0, {})
		return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-sh' ]

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-subversive'
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'wellle/targets.vim'
Plug 'leafgarland/typescript-vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'dracula/vim'
Plug 'junegunn/fzf'

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
"Dart/Flutter
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Dart/Flutter 2 option
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Flutter 3
" Plug 'nvim-lua/plenary.nvim'
" Plug 'stevearc/dressing.nvim' " optional for vim.ui.select
" Plug 'akinsho/flutter-tools.nvim'

call plug#end()

colorscheme dracula
if (has("termguicolors"))
		set termguicolors
endif

hi CocErrorFloat guifg=#f84850

"Leadder mapping
let mapleader = "\<Space>"

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>ce :tabnew $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, c, o in sequence to trigger
nmap <leader>co :source $MYVIMRC<cr>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source $MYVIMRC \| :PlugInstall<CR>

" Constructor surround
nmap <leader>sc ms"sdaw"Sda(i(<C-r>s)<esc>`s

" Common mappings
nmap <CR> :set paste<CR>o<Esc>:set paste<CR> 

" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

autocmd VimEnter *  RainbowParentheses 


"VSCode
if filereadable("~/.config/nvim/vscode.vim")
	source ~/.config/nvim/vscode.vim
endif

" if filereadable("~/.config/nvim/coc.vim")
    " source ~/.config/nvim/coc.vim
" endif

" LSP config
" function! s:on_lsp_buffer_enabled() abort
    " setlocal omnifunc=lsp#complete
    " setlocal signcolumn=yes
    " if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " nmap <buffer> gd <plug>(lsp-definition)
    " nmap <buffer> gs <plug>(lsp-document-symbol-search)
    " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    " nmap <buffer> gr <plug>(lsp-references)
    " nmap <buffer> gi <plug>(lsp-implementation)
    " " nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    " nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    " nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    " nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " " refer to doc to add more commands
" endfunction

" augroup lsp_install
    " au!
    " " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    " autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END

" Autocompletion
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)

" allow modifying the completeopt variable, or it will
" be overridden all the time
" let g:asyncomplete_auto_completeopt = 0

" set completeopt=menuone,noinsert,noselect,preview
 " Show hover
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
 " Jump to definition
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
 " Open code actions using the default lsp UI, if you want to change this please see the plugins above
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
 " Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>

" Basic
set incsearch
set ignorecase
set splitright
set splitbelow

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set wildmode=longest,list
syntax on

set number relativenumber
set nu rnu

" easymotion
nmap <leader>w <Plug>(easymotion-bd-w)
nmap <leader>f <Plug>(easymotion-bd-f)
nmap <leader>t <Plug>(easymotion-bd-t)
nmap <leader>F <Plug>(easymotion-bd-f2)
nmap <leader>e <Plug>(easymotion-bd-e)


" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
vnoremap gc <plug>NERDCommenterToggle
nnoremap gcc <plug>NERDCommenterToggle


" fzf
nmap <leader>p :call fzf#run({'sink': 'tabedit'})<CR>
nmap <leader>h :call fzf#run({'sink': 'split'})<CR>
nmap <leader>v :call fzf#run({'sink': 'vsplit'})<CR>

set clipboard+=unnamedplus

lua require('coc')
