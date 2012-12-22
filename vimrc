"Initialize pathogen
call pathogen#infect()


"Enable solarized color scheme
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

if has("unix")
    set guifont=Ubuntu\ Mono\ 12
elseif has("win32")
    source $VIM/_vimrc
    "Fix for fugitive Gdiff E302 error
    set directory+=,~/tmp,$TMP
endif

if has("gui_win32") || has("gui_win32s")
    set guifont=Inconsolata:h12,Fixedsys:h12,Consolas:h12
endif

"Set status line to contain git branch name
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"Auto clean fugitive buffers
if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif

"mappings
map ,pt  <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>
map ,t   <Esc>:!prove -v %<CR>
nmap ,v :tabedit $MYVIMRC<CR>
nmap ,z :Matrix<CR>
nmap ,q :!perl %<CR>
nmap ,a :!python %<CR>
