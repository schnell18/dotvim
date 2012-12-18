set nu
set columns=82
set sw=2
set expandtab
au! BufRead,BufNewFile *.json setfiletype json 
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>
