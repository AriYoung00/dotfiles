" ======================= GENERAL CONFIGURATION =======================
" Vim apparently needs a more POSIX-compliant shell for some stuff
" So if fish is our shell, switch it out for sh
if &shell =~# 'fish$'
    set shell=sh
endif

" Enable mouse mode
set mouse=a

" Keep status to show airline, set fonts
set laststatus=2
let g:airline_powerline_fonts = 1

" Enable scrollback and open NERDTree if we're in a full-sized terminal
if winheight('%') >=? 35
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd BufWinEnter * NERDTreeMirror
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    set scrolloff=10
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Thin cursor in insert mode
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

" move splits with ctrl+direction
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" Misc stuff
inoremap jj <esc>
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
autocmd filetype tex set textwidth=100
set expandtab
set smartindent
set number
set visualbell


" ======================= VIM-PLUG PLUGIN STUFF =======================
call plug#begin('~/.vim/plugged')

    Plug 'lervag/vimtex'
"    Plug 'davidhalter/jedi-vim'
    Plug 'dag/vim-fish'
    Plug 'sirver/ultisnips'
    Plug 'daeyun/vim-matlab'
    Plug 'joshdick/onedark.vim'
"    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'cespare/vim-toml', { 'branch': 'main' }
    Plug 'dkarter/bullets.vim'
    Plug 'glapa-grossklag/elsa.vim'

    if has('nvim')
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'jackguo380/vim-lsp-cxx-highlight'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'romgrk/barbar.nvim'
    endif

call plug#end()

" ======================= PLUGIN-SPECIFIC CONFIGURATION =======================
" UltiSnips configuration
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
" Vimtex configuration
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
set conceallevel=2


" Markdown configuration
let vim_markdown_preview_github=1


" Latex QOL stuff
autocmd Filetype tex inoremap <bar><bar>  <C-o>:w<CR>
" autocmd Filetype tex let b:AutoPairs = AutoPairsDefine({'$' : '$', '\\\[' : '\\\]'})
autocmd Filetype tex noremap <Bslash><Bslash> <Esc>:w<CR>
autocmd Filetype tex set concealcursor-=n
autocmd Filetype tex VimtexCompile
autocmd Filetype tex autocmd TextChanged,TextChangedI <buffer> silent write


" enable 24 bit color for theme
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:onedark_terminal_italics=1
syntax on
colorscheme onedark
" hi Normal guibg=NONE ctermbg=NONE
