autocmd BufEnter,WinEnter * setlocal cursorline
autocmd BufLeave,WinLeave * setlocal nocursorline
autocmd BufNewFile,BufRead .stepuprc,*.yml.sample setlocal filetype=yaml

set guifont=Monaco:h14
if has("gui_running")
  colorscheme railscasts
  set transparency=20
endif

set list
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<

let mapleader=","
"Fechar o buffer (bufkill.vim)
nmap <Leader>q :BW<CR>

"Tab actions
"nnoremap <C-Tab> :tabNext<CR>

"Buffer actions
"Next buffer
nnoremap <F6> :bn!<CR>

"Shift-Tab - paste TAB
inoremap <S-Tab> <D-V><Tab>

"Moving lines Up/Down
nnoremap <D-A-Down> :m+<CR>==
nnoremap <D-A-Up> :m-2<CR>==
inoremap <D-A-Down> <Esc>:m+<CR>==gi
inoremap <D-A-Up> <Esc>:m-2<CR>==gi
vnoremap <D-A-Down> :m'>+<CR>gv=gv
vnoremap <D-A-Up> :m-2<CR>gv=gv

"highlight OverLength ctermbg=darkred ctermfg=white guibg=darkred
highlight OverLength ctermbg=darkred guibg=#7E2217
match OverLength /\%81v.\+/
