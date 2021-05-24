augroup filetypedetect
    au! BufRead,BufNewFile *.gql setfiletype graphql
    au! BufRead,BufNewFile *.graphql setfiletype graphql
augroup END
