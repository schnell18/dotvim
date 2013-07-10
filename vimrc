"Initialize pathogen
call pathogen#infect()


"Enable solarized color scheme
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

if has("unix")
    if system('uname') =~ 'Darwin'
        set guifont=Menlo\ Regular:h14
    else
        set guifont=Ubuntu\ Mono\ 12
    endif
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

"Add command to get Quickfix file list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
let buffer_numbers = {}
for quickfix_item in getqflist()
let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
endfor
return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"mappings
map ,pt  <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>
map ,t   <Esc>:!prove -v %<CR>
nmap ,v :tabedit $MYVIMRC<CR>
nmap ,z :Matrix<CR>
nmap ,q :!perl %<CR>
nmap ,a :!python %<CR>

" Pytest
nmap <silent>,f <Esc>:Pytest file<CR>
nmap <silent>,c <Esc>:Pytest class<CR>
nmap <silent>,m <Esc>:Pytest method<CR>
