"Initialize pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("unix")
    source $VIM/vimrc
elseif has("win32")
    source $VIM/_vimrc
endif

colorscheme evening

"SQLite profiles
let g:dbext_default_SQLITE_bin = 'sqlite3'
let g:dbext_default_profile_sqlitestudy = 'type=SQLITE:dbname=D:\work\study\SQLite\db\testdb'
let g:dbext_default_profile_sqlitea='type=SQLITE:dbname=d:\work\engagement\UCA\tasks\release\00055610'
let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=d:\work\engagement\UCA\EE_Parser\ws_svn\src\5000'
let g:dbext_default_profile_sqliteb = 'type=SQLITE:dbname=d:\work\engagement\UCA\trunk\src\11110000'
let g:dbext_default_profile_sqlite_prod = 'type=SQLITE:dbname=D:\work\engagement\UCA\EE_Parser\PoC\EE_Prod_data\seed.sqlite'
let g:dbext_default_profile_ee = 'type=ORA:user=qad@ueeora:passwd=qad'
let g:dbext_default_profile_hr = 'type=ORA:user=hr@ueeora:passwd=hr'
let g:dbext_default_profile_dba = 'type=ORA:user=system@ueeora:passwd=oracle'
let g:dbext_default_profile_uca = 'type=ORA:user=uca@ueeora:passwd=uca'

map ,pt  <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>
map ,t   <Esc>:!prove -v %<CR>
nmap ,v :tabedit $MYVIMRC<CR>
nmap ,z :Matrix<CR>
nmap ,q :!perl %<CR>
nmap ,a :!python %<CR>
