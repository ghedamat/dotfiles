set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

runtime macros/matchit.vim

Plugin 'tomtom/tcomment_vim' 
Plugin 'scrooloose/nerdtree' 
Plugin 'bronson/vim-trailing-whitespace' 
Plugin 'ctrlp.vim'
Plugin 'mileszs/ack.vim' 
Plugin 'Blackrush/vim-gocode' 
Plugin 'scrooloose/syntastic' 
Plugin 'kana/vim-textobj-user'

Plugin 'altercation/vim-colors-solarized.git'

Plugin 'dgryski/vim-godef' 

Plugin 'kchmck/vim-coffee-script' 

Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-bundler' 
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-haml' 

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-cucumber.git'
Plugin 'godlygeek/tabular.git'

Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-surround'
"Plugin 'guns/vim-sexp'
"Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'dgrnbrg/vim-redl'
Plugin 'gregspurrier/vim-midje'

Plugin 'Shutnik/jshint2.vim'

Plugin 'nono/vim-handlebars' 
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'wting/rust.vim'

Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell.vim'

Plugin 'osyo-manga/vim-over'


Plugin 'elixir-lang/vim-elixir'

Plugin 'groenewege/vim-less'

"Plugin 'kassio/neoterm'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()    


vnoremap . :norm.<CR>
syntax on
filetype plugin indent on
set noswapfile
set hidden
set autoread
"set mouse=a

set ts=2
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
"set number
"set relativenumber
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
""set cursorline
set cmdheight=1
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
" This makes RVM work inside Vim. I have no idea why.
set shell=zsh
let mapleader=","
let maplocalleader="\\"
nnoremap <leader><leader> <c-^>
let g:CommandTTraverseSCM='pwd'

augroup filetypedetect
  au! BufRead,BufNewFile *nc setfiletype nc
augroup END
noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" status line customization ---------------------- {{{
set guifont=InputMono:h12
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set encoding=utf-8
set termencoding=utf-8

set laststatus=2
" }}}

set ai
set si
set t_Co=256 " 256 colors
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
" Clear all autocmds in the group
autocmd!
autocmd FileType text setlocal textwidth=78
" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

autocmd! BufRead,BufNewFile *.sass setfiletype sass 

autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

augroup END



" global mappings ---------------------- {{{

" fzf settings
set rtp+=~/.fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <leader>f :FZF<cr>
nnoremap <leader>b :Buffers<cr>


inoremap jk <Esc>

" nerdtree
nnoremap <silent> <F9> :NERDTree<CR>

" remove search highlight
nnoremap <CR> :nohlsearch<cr>
" move lines
nnoremap - ddp
nnoremap _ ddkP
" uppercase word
inoremap <c-u> <esc>vawUea
nnoremap <c-u> <esc>vawU

" edit vim rc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"abbreviations as spell correct
iabbrev lenght length

" surround in quotes TODO remove
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

nnoremap H 0
nnoremap L $
"nnoremap K <silent>

" adding movements
" inside next parens
onoremap in( :<c-u>normal! f(vi(<cr>
" inside last parens
onoremap il( :<c-u>normal! F)vi(<cr>

"vimux mappings
nnoremap <leader>rc :VimuxPromptCommand<cr>
nnoremap <leader>rl :RunLastVimTmuxCommand<cr>
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" SOURCE a local vimfile
if filereadable(glob(".vimrc.local"))
      source .vimrc.local
endif

set pastetoggle=<leader>y

nnoremap  <leader>t :tabnew<cr>
nnoremap  <leader>s :vs<cr>
nnoremap  <leader>w :sv<cr>


" RUST
autocmd FileType rust,rs nnoremap <buffer> <leader>r :RustRun<cr>
set backspace=indent,eol,start

" IGNORED PATHS
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*.o,*.obj,.git
set wildignore+=**/bower_components/**
set wildignore+=**/node_modules/**
set wildignore+=public/system/**
set wildignore+=db/sphinx/**
set wildignore+=tmp/**
set wildignore+=gems/**

let g:redl_use_vsplit = 1

" visual find replace
function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" tabular align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
