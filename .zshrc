# vim like
bindkey -v

if [ -e /opt/homebrew/bin/brew ]; then
  export PATH=$PATH:/opt/homebrew/bin
fi

# aliases
source ~/.zsh_alias

# asdf
. "$HOME/.asdf/asdf.sh"

# zsh基本設定
export LANG=ja_JP.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# brewでインスコしたやつのzsh補完リンク設定
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -Uz compinit && compinit

# zsh: no matches found対策
setopt nonomatch

# cd無しでcd
setopt auto_cd

# cdでタブするとディレクトリ一覧を表示
setopt auto_pushd

# UTF-8環境での日本語対応
setopt print_eight_bit

# スペルチェック(nyae)禁止
unsetopt correct_all

# 補完候補を詰める
setopt list_packed

# カッコの補完
setopt auto_param_keys

# ディレクトリ名補完で末尾にスラッシュを付与
setopt auto_param_slash

# プログラム関連の設定をロード
if [ -e ~/.zsh_program ]; then
    source ~/.zsh_program
fi

# Go
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

# その端末固有の設定をロードする
if [ -e ~/.zsh_local ]; then
    source ~/.zsh_local
fi

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

export TERM='xterm-256color'

# XDG
export XDG_CONFIG_HOME="$HOME/.config" 

# editor
export EDITOR='nvim'
# direnv(requires EDITOR)
eval "$(direnv hook zsh)"

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  source ~/.cargo/env
fi

# starship
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Node, nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/stormcat/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/stormcat/.config/.dart-cli-completion/zsh-config.zsh ]] && . /Users/stormcat/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Pub
PUB_CACHE="$HOME/.pub-cache"
if [ -d "$PUB_CACHE" ]; then
  export PATH=$PATH:$PUB_CACHE/bin
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/stormcat/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
