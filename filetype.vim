" Progress .w file filetype detection rule
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.i   setfiletype progress
  au! BufRead,BufNewFile *.w   setfiletype progress
  au! BufRead,BufNewFile *.cls setfiletype progress
  au! BufRead,BufNewFile *.t   setfiletype progress
augroup END
