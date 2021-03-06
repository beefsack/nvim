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
call dein#add('Shougo/denite.nvim')
call dein#add('dracula/vim')
call dein#add('hhvm/vim-hack')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tpope/vim-sleuth') " Indentation detection
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-airline/vim-airline')
call dein#add('mxw/vim-jsx')
call dein#add('tpope/vim-fugitive') " Git in Airline
call dein#add('benekastah/neomake')
call dein#add('fatih/vim-go')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('mileszs/ack.vim')

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
set clipboard=unnamedplus

color dracula
highlight Pmenu ctermbg=238 guibg=gray40

let mapleader=","
:nnoremap <leader>f :Denite file_rec<CR>

" Create temporary files in a temp dir
let g:tmpdir = $HOME . '/.vimtmp'
call mkdir(g:tmpdir, 'p')
let &backupdir = g:tmpdir . '//,.'
let &directory = g:tmpdir . '//,.'

" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

" JSX
let g:jsx_ext_required = 0

" Airline
let g:airline_powerline_fonts = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

" Hack
function HhFormat()
  let formatted = system('hh_format', join(getline(1, '$'), "\n"))
  if !empty(formatted) && !v:shell_error
    let c_pos = getpos('.')
    %delete
    put =formatted
    1d
    call setpos('.', c_pos)
  endif
endfunction
au BufWritePre *.php call HhFormat()

" Gutentags
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = g:tmpdir

" ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
