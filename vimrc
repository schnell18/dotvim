"Always display statusline
set laststatus=2
if has("unix")

    if system('uname') =~ 'Darwin'
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14,Inconsolata\ for\ Powerline:h18
    else
        " Unlike MacOS X, font size is separated by space on Ubuntu,
        " followed by the number to specify the font size. 14~15 is good
        " for laptop screen
        " set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular\ 15
        set guifont=JetBrains\ Mono\ Regular\ 14
    endif
elseif has("win32")
    "make powerline display special characters correctly
    set encoding=utf-8
    set fileencodings=utf-8,cp936
    language messages zh_CN.utf-8
    source $VIM/_vimrc
    "Fix for fugitive Gdiff E302 error
    set directory+=,~/tmp,$TMP
    if has("gui_win32") || has("gui_win32s")
        set guifont=Input\ Mono:h16,Inconsolata\ for\ Powerline:h12,Fixedsys:h12,Consolas:h12
    endif
endif

packadd minpac
call minpac#init()

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"Enable modeline
set modelines=1

"
highlight ColorColumn ctermbg=magenta
"set columns=140
set colorcolumn=81

"Enable filetype plugin
filetype plugin on
syntax on

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

"Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Persistent undo
set undofile
if !has('nvim')
    set undodir=~/.vim/undo
endif
augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" mappings
" map ,pt  <Esc>:%! perltidy<CR>
" map ,ptv <Esc>:'<,'>! perltidy<CR>
" map ,t   <Esc>:!prove -v %<CR>
" nmap ,q :!perl %<CR>
" nmap ,c :!perl -c %<CR>
" nmap ,w :!plackup %<CR>

nmap ,v :tabedit $MYVIMRC<CR>
nmap ,p :!python %<CR>
nmap ,e :TlistOpen<CR>

"mappings for tabularize
nmap a= :Tabularize /=<CR>
vmap a= :Tabularize /=<CR>
nmap a: :Tabularize /:\zs<CR>
vmap a: :Tabularize /:\zs<CR>

"mapping for Graphgviz
map ,cs  <Esc>:!circo -O -Tsvg %<CR>
map ,wts <Esc>:!twopi -O -Tsvg %<CR>
map ,nts <Esc>:!neato -O -Tsvg %<CR>
map ,gs  <Esc>:!dot -O -Tsvg %<CR>
map ,gf  <Esc>:!dot -O -Tpdf %<CR>
map ,gg  <Esc>:!dot -O -Tpng %<CR>


"mapping for plantuml
map ,pu  <Esc>:!plantuml % -tsvg<CR>

"mapping for json formatter
map ,js  <Esc>:%!~/bin/json_tidy.py<CR>
vmap ,js :!~/bin/json_tidy.py<CR>

" Plugins management section
call minpac#add('aklt/plantuml-syntax')
" call minpac#add('altercation/vim-colors-solarized')
call minpac#add('ekalinin/Dockerfile.vim')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-obsession')
call minpac#add('vim-scripts/dbext.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('vim-airline/vim-airline')
" call minpac#add('morhetz/gruvbox')
let g:airline_powerline_fonts = 1
call minpac#add('neoclide/coc.nvim')
call minpac#add('preservim/nerdtree')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
" call minpac#add('airblade/vim-rooter')
call minpac#add('hotoo/pangu.vim')
call minpac#add('mhinz/vim-startify')
call minpac#add('honza/vim-snippets')
" let g:DevIconsEnableFoldersOpenClose = 1


augroup Chinese
  au!
  au BufWritePre *.markdown,*.md call PanGuSpacing()
  au BufWritePre *.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
  au BufWritePre *.wiki,*.cnx call PanGuSpacing()
augroup END

augroup Binary
  au!
  au BufReadPre  *.class let &bin=1
  au BufReadPost *.class if &bin | %!xxd
  au BufReadPost *.class set ft=xxd | endif
  au BufWritePre *.class if &bin | %!xxd -r
  au BufWritePre *.class endif
  au BufWritePost *.class if &bin | %!xxd
  au BufWritePost *.class set nomod | endif
augroup END
