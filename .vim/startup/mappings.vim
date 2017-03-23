" customized mappings

" disable arrow keys
vno <down> <Nop>
vno <up> <Nop>
vno <right> <Nop>
vno <left> <Nop>
ino <down> <Nop>
ino <up> <Nop>
nnoremap <Left> : echo "press H"<CR>
nnoremap <Up> : echo "press K"<CR>
nnoremap <Down> : echo "press J"<CR>
nnoremap <right> : echo "press L"<CR>

" Easymotion
nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>f <Plug>(easymotion-bd-f)
" Jump between definitions
nmap <Leader>d <C-]>
nmap <leader>t <C-t>
nmap <leader>o <C-o>
map <leader>s :w<CR>

" open this file quickly
inoremap <D-s> <ESC>:w<CR>
noremap <D-e> <ESC>:e ~/.vim/startup/mappings.vim<CR>
" create a new line below cursor in normal mode
nmap <leader>go o<ESC>k

" create a new line above cursor (Ctrl to prevent collision with 'go' command)
nmap <leader>gO O<ESC>j

" move line above 
nmap <C-j> ddp
nmap <C-k> ddkP

"I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap H Hzz
nmap M Mzz
nmap L Lzz
nmap } }zz
nmap { {zz

"custom comma motion mapping
nmap di, f,dT,
nmap ci, f,cT,
nmap da, f,ld2F,i,<ESC>l "delete argument 
nmap ca, f,ld2F,i,<ESC>a "delete arg and insert

" Vim-go
au FileType go nmap <leader>b :w<CR><Plug>(go-build)
au FileType go nmap <leader>r :w<CR><Plug>(go-test)
au FileType go nmap <leader>c :w<CR><Plug>(go-coverage)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)

nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>
