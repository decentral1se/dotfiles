scriptencoding utf-8

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

" Color schemes
Plug 'flazz/vim-colorschemes'

" Haskell
Plug 'mpickering/hlint-refactor-vim', {'for': 'haskell'}
Plug 'parsonsmatt/intero-neovim', {'for': 'haskell'}
Plug 'eagletmt/neco-ghc', {'for': 'haskell'}

" Python
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}

" Auto-complete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-bash --no-fish' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
Plug 'AndrewRadev/linediff.vim'

" Navigation
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'terryma/vim-multiple-cursors'
Plug 'Lokaltog/vim-easymotion'
Plug 'mklabs/split-term.vim'
Plug 'romgrk/winteract.vim'

" Linting
Plug 'neomake/neomake'

" Enhancements
Plug 'rafi/vim-tinyline'
Plug 'ervandew/supertab'
Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'

" Neovim Terminal Utilities
Plug 'mhinz/neovim-remote'
Plug 'kassio/neoterm'

" Writing
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-litecorrect'
Plug 'dbmrq/vim-ditto'

" Elm
Plug 'pbogut/deoplete-elm'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

set background=dark
colorscheme gruvbox

let g:mapleader=','
let g:gitgutter_max_signs=10000
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_smart_startup_focus=2
let g:nerdtree_tabs_startup_cd=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeShowHidden=1
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_cache_dir=$HOME . '.cache/ctrlp'
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=1
let g:ctrlp_by_filename=1
let g:ctrlp_show_hidden=1
let g:ctrlp_max_height=30
let g:ctrlp_max_files=5000
let g:ctrlp_max_depth=100
let g:ctrlp_lazy_update=1
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_extensions=['funky', 'tag']
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_ignore_case=1
let g:deoplete#enable_smart_case=1
let g:neomake_python_enabled_makers=['pylama']
let g:neomake_vim_enabled_makers=['vint']
let g:neomake_haskell_enabled_makers=['hlint']
let g:neomake_markdown_enabled_makers=['proselint']
let g:neomake_elm_enabled_makers=['elmMake']
let g:neomake_open_list=2
let g:SuperTabDefaultCompletionType='<c-n>'
let g:SuperTabLongestHighlight=1
let g:jedi#usages_command=''
let g:jedi#popup_select_first=1
let g:jedi#use_tabs_not_buffers=1
let g:jedi#show_call_signatures='2'
let g:jedi#auto_close_doc=1
let g:vim_isort_map='<C-i>'
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsListSnippets='<c-k>'
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_upper=1
let g:EasyMotion_startofline=1
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:terminal_scrollback_buffer_size=100000
let g:necoghc_enable_detailed_browse=1
let g:deepspace_italics=1
let g:neoterm_position='horizontal'
let g:neoterm_size=10
let g:neoterm_autoinsert=1
let g:intero_ghci_options='-fobject-code'
let g:intero_start_immediately=0
let g:elm_detailed_complete=1
let g:elm_format_autosave=1
let g:elm_syntastic_show_warnings=1

augroup neovim
  autocmd!
  autocmd! BufReadPost * nested call MyFollowSymlink(expand('%'))
  autocmd! BufWritePre  * StripWhitespace
  autocmd! BufWinEnter,WinEnter,TermOpen,BufEnter term://* startinsert
  autocmd! BufLeave term://* stopinsert
augroup END

augroup haskell
  autocmd!
  autocmd! BufWritePost package.yaml silent !hpack --silent
  autocmd! FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd! FileType haskell setlocal formatprg=stylish-haskell
augroup END

augroup filetypemania
  autocmd!
  autocmd! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd! FileType python,markdown let b:delimitMate_nesting_quotes=['"', '`', "'"]
  autocmd! FileType nerdtree setlocal relativenumber
  autocmd! FileType qf set wrap
augroup END

augroup writing
  autocmd!
  autocmd! FileType markdown,mkd call litecorrect#init()
augroup END

augroup ditto
  autocmd!
  autocmd! FileType markdown DittoOn
augroup END

imap jk <Esc>

ino <C-e> <C-o>a
ino <C-d> <C-o>A

nn <Leader>Z 1z=
nn <C-t> :tabnew<cr>
nn <Leader>ev :split $MYVIMRC<cr>
nn <Leader>sv :source $MYVIMRC<cr>

nn <Leader>pi :PlugInstall<cr>
nn <Leader>pu :PlugUpdate<cr>
nn <Leader>pg :PlugUpgrade<cr>
nn <Leader>pc :PlugClean<cr>

nn <Leader>cf :CtrlPFunky<cr>
nn <Leader>ct :CtrlPTag<cr>

map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map <space>s <Plug>(easymotion-s)

nn <Leader><C-n> :NERDTreeToggle<cr>

nn <C-j> <C-w>j
nn <C-k> <C-w>k
nn <C-l> <C-w>l
nn <C-h> <C-w>h

nn <Leader>io :InteroOpen<cr>
nn <Leader>ik :InteroKill<cr>
nn <Leader>ih :InteroHide<cr>
nn <Leader>il :InteroLoadCurrentModule<cr>
nn <Leader>it :InteroGenericType<cr>
nn <Leader>iT :InteroType<cr>
nn <Leader>ii :InteroInfo<cr>
nn <Leader>iR :InteroReload<cr>
nn <Leader>if :InteroLoadCurrentFile<CR>

nn <Leader>pp :T ipython<cr>

nn <Leader>dsp :T python manage.py shell_plus --ipython --quiet-load<cr>
nn <Leader>ds  :T python manage.py shell<cr>

nn <Leader>p :T pytest -sv --pdb<cr>

nn <Leader>tc :Tclose<cr>
nn <Leader>to :Topen<cr>

nn <Leader>tv :VTerm<cr>

if exists(':tnoremap')
  tnoremap jk <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
endif

nmap <leader>w :InteractiveWindow<CR>

syntax on
filetype plugin indent on

set background=dark
set spell spelllang=en_gb
set number
set cursorline
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc*,*/.venv/*
set completeopt=menuone,preview
set wrap!
set incsearch
set ignorecase
set textwidth=0
set wrapmargin=0
set nobackup
set nowritebackup
set noswapfile
set history=999
set backspace=indent,eol,start
set ruler
set showmode
set laststatus=2
set scrolloff=10
set cmdheight=2
set hlsearch
set gdefault
set hidden
set whichwrap+=<,>,[,]
set wildmenu
set title
set virtualedit=onemore
set fileencodings=.
set spelllang=en_gb
set foldmethod=indent
set foldlevel=99
set relativenumber
set nohlsearch
set listchars=tab:»·,trail:·,eol:¬,nbsp:_,extends:»,precedes:«
set list
set expandtab
set nosmartindent
set clipboard+=unnamedplus
set shiftwidth=2
set softtabstop=2
set tabstop=2
set splitbelow
set splitright
set inccommand=split
set termguicolors

function! MyFollowSymlink(...)
  if exists('w:no_resolve_symlink') && w:no_resolve_symlink
    return
  endif
  if &filetype ==# 'help'
    return
  endif
  let l:fname=a:0 ? a:1 : expand('%')
  if l:fname =~# '^\w\+:/'
    return
  endif
  let l:fname=simplify(l:fname)
  let l:resolvedfile=resolve(l:fname)
  if l:resolvedfile == l:fname
    return
  endif
  let l:resolvedfile=fnameescape(l:resolvedfile)
  let l:sshm=&shortmess
  set shortmess+=A
  redraw
  exec 'file ' . l:resolvedfile
  let &shortmess=l:sshm
  unlet! b:git_dir
  call fugitive#detect(l:resolvedfile)
  if &modifiable
    redraw
    echomsg 'Resolved symlink: =>' l:resolvedfile
  endif
endfunction

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \     <q-args>,
  \     <bang>0 ? fzf#vim#with_preview('up:60%')
  \             : fzf#vim#with_preview('right:50%:hidden', '?'),
  \     <bang>0)

command! Gc  :Gcommit -v
command! Gcf :Gcommit --fixup
command! Gw  :Gwrite
command! Gap :Git add --patch
command! Gd  :Git diff
command! Gs  :Gstatus
command! Gp  :Git push origin master
command! Gb  :Git checkout -b
command! Go  :Git checkout .

call neomake#configure#automake('w', 750)
