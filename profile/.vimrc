autocmd BufEnter,WinEnter * setlocal cursorline
autocmd BufLeave,WinLeave * setlocal nocursorline
autocmd BufNewFile,BufRead *.yml.sample setlocal filetype=yaml

let mapleader=","
set guifont=Monaco:h14
if has("gui_running")
  colorscheme railscasts
  set columns=135
endif

set list
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<

nnoremap <Leader>b :BufExplorer<CR>
"Fechar o buffer (bufkill.vim)
nmap <Leader>q :BW<CR>
nmap <Leader>p :NERDTreeToggle<CR>

"Ações de Tabs
nnoremap <C-Tab> :tabNext<CR>

"Control-A - select all
nnoremap <C-A> ggVG

"Control-C - copy selected
vmap <C-C> "+y
"Control-V - paste clipboard
nnoremap <C-V> "+gp
nnoremap <C-S-V> "+gP
vmap <C-V> "+gp
vmap <C-S-V> "+gP

"Shift-Tab - paste TAB
inoremap <S-Tab> <C-V><Tab>

"Moving lines Up/Down
nnoremap <S-Down> :m+<CR>==
nnoremap <S-Up> :m-2<CR>==
inoremap <S-Down> <Esc>:m+<CR>==gi
inoremap <S-Up> <Esc>:m-2<CR>==gi
vnoremap <S-Down> :m'>+<CR>gv=gv
vnoremap <S-Up> :m-2<CR>gv=gv
