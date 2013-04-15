# aliases
alias ll='ls -l'
alias la='ls -la'
alias ls='ls -G'

# その端末固有の設定をロードする
if [ -e ~/.bash_local ]; then
    source ~/.bash_local
fi
