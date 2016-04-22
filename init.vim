"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tomasr/molokai')
call dein#add('hhvm/vim-hack')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tpope/vim-sleuth') " Indentation detection
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-airline/vim-airline')
call dein#add('mxw/vim-jsx')
call dein#add('tpope/vim-fugitive') " Git in Airline
call dein#add('benekastah/neomake')
call dein#add('fatih/vim-go')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('Chiel92/vim-autoformat')
call dein#add('scrooloose/nerdtree')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax on
set tabstop=4
set cursorline
set cc=80
set ignorecase
set smartcase

colorscheme molokai

" Create temporary files in a temp dir
let g:tmpdir = $HOME . '/.vimtmp'
call mkdir(g:tmpdir, 'p')
let &backupdir = g:tmpdir . '//,.'
let &directory = g:tmpdir . '//,.'

" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=0
hi IndentGuidesEven ctermbg=8

" JSX
let g:jsx_ext_required = 0

" Airline
let g:airline_powerline_fonts = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

" Hack
let g:formatdef_hh_format = '"hh_format"'
let g:formatters_php = ['hh_format']
autocmd BufWrite *.php,*.hh :Autoformat

" CtrlP
let g:ctrlp_abbrev = {
  \ 'gmode': 'i',
  \ 'abbrevs': [
    \ {
      \ 'pattern': ' ',
      \ 'expanded': '',
      \ 'mode': 'pfrz',
    \ },
    \ ]
  \ }

" Neomake
fun! CustomNeomake()
  if &ft == 'rust'
    Neomake! cargo
  else
    Neomake
  endif
endfun
autocmd! BufWritePost * call CustomNeomake()

" Gutentags
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = g:tmpdir
