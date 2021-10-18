set number
set mouse=a
set clipboard+=unnamedplus

"better backspace?"
set backspace=indent,eol,start

" Set tabs to be 4 spaces wide
set tabstop=4
set shiftwidth=4
set breakindent


"hide buffer"
set hidden

"better search"
set ignorecase
set smartcase
set incsearch
set hlsearch

"syntax highlighting"
syntax on

"move lines"
nnoremap <c-Down> :m .+1<CR>==
nnoremap <c-Up> :m .-2<CR>==
inoremap <c-Down> <Esc>:m .+1<CR>==gi
inoremap <c-Up> <Esc>:m .-2<CR>==gi
vnoremap <c-Down> :m '>+1<CR>gv=gv
vnoremap <c-Up> :m '<-2<CR>gv=gv

"auto braces"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"auto completion for helpmenu"
set wildmode=longest,list,full

"disable auto comment"
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Plugins"
call plug#begin()
Plug 'mattn/emmet-vim'
"Plug 'whatyouhide/vim-gotham'"
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
"Plug 'valloric/youcompleteme'"
"Plug 'sbdchd/neoformat'"
call plug#end()

"EMMET CONFIG"
"redefine trigger key"
let g:user_emmet_leader_key=","
"only in HTML/CSS"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"DWMblocks autocompile on edit"
autocmd BufWritePost /home/peter/dwm\ shenanigans/Luke\ Smith\'s\ dwmblocks/config.h !cd /home/peter/dwm\ shenanigans/Luke\ Smith\'s\ dwmblocks/; echo 'cars123' | sudo -S make install && { killall -q dwmblocks;setsid dwmblocks & }


"Syntastic Beginner stuff"
"set statusline+=%#warningmsg#"
"set statusline+=%{SyntasticStatuslineFlag()}"
""set statusline+=%*"

"let g:syntastic_always_populate_loc_list = 1"
"let g:syntastic_auto_loc_list = 1"
"let g:syntastic_check_on_open = 1"
"let g:syntastic_check_on_wq = 0"

"NeoFormat Format On Save"
"augroup fmt"
  "autocmd!"
  "autocmd BufWritePre * undojoin | Neoformat"
"augroup END"

"Enable 256 Colour Mode"
set t_Co=256

"Gotham colourscheme"
"colorscheme gotham256"

"lightline colourscheme, :h g:lightline.colorscheme for the list https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md"
let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ 'active': {
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ }

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

"Papercolor colourscheme"
"set background=dark"
let g:PaperColor_Theme_Options = {
			\   'theme': {
			\     'default.dark': {
			\       'override' : {
			\         'color00' : ['#000000', ''],
			\         'linenumber_bg' : ['#000000', '232'],
			\         'linenumber_fg' : ['#00FF00', ''],
			\         'statusline_active_bg' : ['#40E0D0', ''],
			\         'statusline_active_fg' : ['#000000', ''],
			\       }
			\     }
			\   }
			\ }
colorscheme PaperColor
