" use clipboard
"set clipboard+=unnamedplus

" color scheme
let g:spacevim_colorscheme = 'jellybeans'

" custom plugins
let g:spacevim_custom_plugins = [
        \ ['Shougo/vimshell'], 
        \ ['basyura/twibill.vim'], 
        \ ['basyura/TweetVim'], 
        \ ['tyru/open-browser.vim'], 
        \ ['fatih/vim-go'], 
        \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
        \ ['wsdjeg/GitHub.vim'],
        \ ['LeafCage/yankround.vim'],
        \ ['kien/ctrlp.vim'],
    \   ]

""" TweetVim
let g:tweetvim_tweet_per_page = 200
let g:tweetvim_display_username = 1

runtime basic.vim

runtime key.vim 
